output "vpc_id" {
  value = aws_vpc.this.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_private_key_pem" {
  value = tls_private_key.bastion.private_key_pem
  sensitive = true
}

output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_port" {
  value = aws_db_instance.this.port
}

output "secret_name" {
  value = aws_secretsmanager_secret.rds_master.name
}

output "restore_s3_bucket" {
  value = aws_s3_bucket.restore.bucket
}
