# Fetching data from existing resources

data "aws_ami" "amazon_linux_2" {
  most_recent      = true    # If I say true it wil give me the most updated AMI 
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


# Fetching data from existing file

data "template_file" "user_data" {
    template = file("userdata.sh")
    vars = {
        environment = var.env
    }
}

# Amazon Linux 2 AMI