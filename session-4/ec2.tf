resource "aws_instance" "first_ec2" {
  ami                    = data.aws_ami.amazon_linux_2.image_id                   
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.first_sg.id]
  user_data = data.template_file.user_data.rendered
  tags = {
    Name = "Hello from ${var.env} environment"
    Name2 = format("Hello from %s environment", var.env)
  }
}
                                                             
 #terraform init
 #terraform plan
 #terraform apply
 # it will automatically pick terraform.tfvars file for me
 # terraform.tfvars is default vars file
 
 
 # If I'd like to run with dev.tfvars file
 #terraform init
 #terraform plan -var-file=dev.tfvars
 #terraform apply -var-file=dev.tfvars
 
# How do we know this is a function =  ()
