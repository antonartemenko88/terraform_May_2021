provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.15.0" # Terraform version
  required_providers {           # Provider
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.40.0"
    }
  }
}