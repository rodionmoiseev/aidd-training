variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-northeast-1"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "slalomjapan-aidd-experience-training"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for public subnet 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for public subnet 2"
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR block for private subnet 1"
  default     = "10.0.11.0/24"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for private subnet 2"
  default     = "10.0.12.0/24"
}

variable "allowed_ssh_cidrs" {
  type        = list(string)
  description = "Allowed public CIDRs for SSH to bastion"
}

variable "bastion_instance_type" {
  type        = string
  description = "EC2 instance type for the bastion host"
  default     = "t3.micro"
}

variable "db_username" {
  type        = string
  description = "Master username for the RDS instance"
  default     = "adminuser"
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  type        = number
  description = "Initial allocated storage in GB"
  default     = 20
}

variable "db_max_allocated_storage" {
  type        = number
  description = "Maximum allocated storage in GB for autoscaling"
  default     = 100
}

variable "db_engine" {
  type        = string
  description = "RDS database engine (e.g. sqlserver-ex)"
  default     = "sqlserver-ex"
}

variable "db_major_engine_version" {
  type        = string
  description = "Major engine version for the DB option group (e.g. 16.00)"
  default     = "16.00"
}

variable "db_engine_version" {
  type        = string
  description = "RDS engine version"
  default     = "16.00.4245.2.v1"
}

variable "db_parameter_group_family" {
  type        = string
  description = "DB parameter group family (e.g. sqlserver-ex-16.0)"
  default     = "sqlserver-ex-16.0"
}

variable "multi_az" {
  type        = bool
  description = "Enable Multi-AZ deployment for RDS"
  default     = false
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain automated backups"
  default     = 7
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection for RDS"
  default     = true
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot when destroying the RDS instance"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Apply RDS modifications immediately instead of during the next maintenance window"
  default     = false
}

variable "ec2_key_pair_name" {
  type        = string
  description = "EC2 key pair name to create/import"
  default     = "slalomjapan-aidd-experience-training-bastion-key"
}

variable "restore_s3_bucket_name" {
  type        = string
  description = "S3 bucket name that stores SQL Server backup files"
  default     = "slalomjapan-aidd-experience-training-s3"
}

variable "owner_suffix" {
  type        = string
  description = "Unique suffix per user, e.g. sllmjpn"
  validation {
    condition     = can(regex("^[a-z0-9-]{2,12}$", var.owner_suffix))
    error_message = "owner_suffix must be 2-12 chars of lowercase letters, numbers, or hyphen."
  }
}