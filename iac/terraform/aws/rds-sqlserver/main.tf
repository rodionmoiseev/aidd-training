provider "aws" {
  region = var.aws_region

  ignore_tags {
    keys = ["CreatorId", "CreatorName"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "aws_caller_identity" "current" {}

locals {
  name_prefix         = "${var.project_name}-${var.environment}-${var.owner_suffix}"
  az1                 = data.aws_availability_zones.available.names[0]
  az2                 = data.aws_availability_zones.available.names[1]
  restore_bucket_name = "${var.restore_s3_bucket_name}-${var.owner_suffix}-${data.aws_caller_identity.current.account_id}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# ------------------------
# VPC
# ------------------------
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-igw"
  })
}

# ------------------------
# Subnets
# ------------------------
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = local.az1
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-public-1"
  })
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = local.az2
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-public-2"
  })
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = local.az1

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-private-1"
  })
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = local.az2

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-private-2"
  })
}

# ------------------------
# Routing
# ------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-public-rt"
  })
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

# ------------------------
# Security Groups
# ------------------------
resource "aws_security_group" "bastion" {
  name        = "${local.name_prefix}-bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-bastion-sg"
  })
}

resource "aws_security_group" "rds" {
  name        = "${local.name_prefix}-rds-sg"
  description = "Security group for RDS SQL Server"
  vpc_id      = aws_vpc.this.id

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-rds-sg"
  })
}

resource "aws_security_group_rule" "rds_from_bastion" {
  type                     = "ingress"
  security_group_id        = aws_security_group.rds.id
  from_port                = 1433
  to_port                  = 1433
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  description              = "Allow SQL Server from bastion"
}

# ------------------------
# SSH Key Pair
# ------------------------
resource "tls_private_key" "bastion" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion" {
  key_name   = var.ec2_key_pair_name
  public_key = tls_private_key.bastion.public_key_openssh

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-bastion-key"
  })
}

# ------------------------
# IAM Role for Bastion
# ------------------------
resource "aws_iam_role" "bastion" {
  name = "${local.name_prefix}-bastion-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy" "bastion_secrets_access" {
  name = "${local.name_prefix}-bastion-secrets-access"
  role = aws_iam_role.bastion.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = aws_secretsmanager_secret.rds_master.arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "bastion" {
  name = "${local.name_prefix}-bastion-instance-profile"
  role = aws_iam_role.bastion.name
}

# ------------------------
# S3
# ------------------------
resource "aws_s3_bucket" "restore" {
  bucket = local.restore_bucket_name

  tags = merge(local.common_tags, {
    Name = local.restore_bucket_name
  })
}

resource "aws_s3_bucket_public_access_block" "restore" {
  bucket                  = aws_s3_bucket.restore.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "restore" {
  bucket = aws_s3_bucket.restore.id

  rule {
    id     = "expire-backup-files"
    status = "Enabled"

    filter {}

    expiration {
      days = 7
    }
  }
}

# ------------------------
# IAM Role for S3 Restore
# ------------------------
resource "aws_iam_role" "rds_s3_restore" {
  name = "${local.name_prefix}-rds-s3-restore-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy" "rds_s3_restore" {
  name = "${local.name_prefix}-rds-s3-restore-policy"
  role = aws_iam_role.rds_s3_restore.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = aws_s3_bucket.restore.arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectAttributes"
        ]
        Resource = "${aws_s3_bucket.restore.arn}/*"
      }
    ]
  })
}

# ------------------------
# Secrets Manager
# ------------------------
resource "random_password" "rds_master" {
  length           = 20
  special          = true
  override_special = "!#$%^*()-_=+[]{}"
}

resource "aws_secretsmanager_secret" "rds_master" {
  name = "${local.name_prefix}/rds/sqlserver/master"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-rds-master-secret"
  })
}

resource "aws_secretsmanager_secret_version" "rds_master" {
  secret_id = aws_secretsmanager_secret.rds_master.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.rds_master.result
  })
}

# ------------------------
# DB Subnet Group / Parameter Group
# ------------------------
resource "aws_db_subnet_group" "this" {
  name = "${local.name_prefix}-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-db-subnet-group"
  })
}

resource "aws_db_parameter_group" "this" {
  name        = "${local.name_prefix}-sqlserver-pg"
  family      = var.db_parameter_group_family
  description = "Parameter group for SQL Server"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-sqlserver-pg"
  })
}

resource "aws_db_option_group" "sqlserver_backup_restore" {
  name                 = "${local.name_prefix}-sqlserver-og"
  engine_name          = var.db_engine
  major_engine_version = var.db_major_engine_version

  option {
    option_name = "SQLSERVER_BACKUP_RESTORE"

    option_settings {
      name  = "IAM_ROLE_ARN"
      value = aws_iam_role.rds_s3_restore.arn
    }
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-sqlserver-og"
  })
}

# ------------------------
# RDS for SQL Server
# ------------------------
resource "aws_db_instance" "this" {
  identifier = "${local.name_prefix}-sqlserver"

  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  username = var.db_username
  password = random_password.rds_master.result
  port     = 1433

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.this.name

  publicly_accessible        = false
  multi_az                   = var.multi_az
  backup_retention_period    = var.backup_retention_period
  deletion_protection        = var.deletion_protection
  skip_final_snapshot        = var.skip_final_snapshot
  apply_immediately          = var.apply_immediately
  auto_minor_version_upgrade = true
  maintenance_window = "sun:18:00-sun:19:00"
  backup_window      = "17:00-18:00"

  license_model = "license-included"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-sqlserver"
  })

  depends_on = [aws_secretsmanager_secret_version.rds_master]

  option_group_name = aws_db_option_group.sqlserver_backup_restore.name
}

# ------------------------
# Bastion EC2
# ------------------------
resource "aws_instance" "bastion" {
  ami                         = data.aws_ssm_parameter.al2023_ami.value
  instance_type               = var.bastion_instance_type
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.bastion.key_name
  iam_instance_profile        = aws_iam_instance_profile.bastion.name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y jq awscli

              cat <<'INFO' > /home/ec2-user/README_RDS.txt
              RDS endpoint: ${aws_db_instance.this.address}
              RDS port: ${aws_db_instance.this.port}
              Secret ARN: ${aws_secretsmanager_secret.rds_master.arn}

              Get secret:
              aws secretsmanager get-secret-value --secret-id ${aws_secretsmanager_secret.rds_master.name} --region ${var.aws_region} | jq -r .SecretString

              Example port forward from your local machine:
              ssh -i ${var.ec2_key_pair_name}.pem -L 1433:${aws_db_instance.this.address}:1433 ec2-user@<BASTION_PUBLIC_IP>

              Get bastion IP:
              terraform output bastion_public_ip

              INFO

              chown ec2-user:ec2-user /home/ec2-user/README_RDS.txt
              EOF

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-bastion"
  })
}