terraform {
  backend "s3" {
      bucket = "terraform-may-2021-session-remote-state2"
      key = "session-5/qa/terraform.tfstate"
      region = "us-east-1"
  }
}


                ######### One Thing to Keep in Mind #############

       # 1. This s3 bucket must be existiong 
       # 2  We create manually or with the bash script 

            
# bucket = name of the bucket 
# key = path to the file (terraform.tfstate)
# region = region of the bucket 

// 1 . Terraform init
// 2 . Terraform plan
// 3 . Terraform apply = helps you to create a terraform.tfstate file
