terraform {
  backend "s3" {
    bucket = "terraform-may-2021-session-remote-state2"
    key    = "session-6/terraform.tfstate"
    region = "us-east-1"
  }
}

############ ONE THING to KEEP IN MIND ##############

# 1. This S3 bucket has to be existing
# 2. We create manually or with the bash script

# bucket = name of the bucket
# key = path to a file (terraform.tfstate)
# region = region of the bucket


// 1. Terraform init  = initialize the backend
// 2. Terraform plan  = execution plan
// 3. Terraform apply = helps you to create a terraform.tfstate file