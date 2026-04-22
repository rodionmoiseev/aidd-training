terraform {
  required_version = ">= 1.5.0"

  # To use remote state, uncomment the backend block below and run `terraform init`:
  # backend "s3" {
  #   bucket = "<your-tfstate-bucket>"
  #   key    = "rds-sqlserver/terraform.tfstate"
  #   region = "ap-northeast-1"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}