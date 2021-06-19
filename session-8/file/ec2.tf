resource "aws_instance" "first_ec2" {
  count = 1
  ami                    = data.aws_ami.amazon_linux_2.image_id                   
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.first_sg.id]
  key_name = aws_key_pair.terraform_key.key_name
  tags = {
    Name = "File provisioning instance"
  }
  provisioner "file" {
    source = "/tmp/index.html"                  //Terraform server = where is the file ?
    destination = "/tmp/index.html"             // Remote machine, server , instances =where should the file go ?
    
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file ("~/.ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd",
        "sudo cp /tmp/index.html /var/www/html/index.html",
        "sudo touch test.txt"
      
    ]
  
    

    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file ("~/.ssh/id_rsa")
    }
  }
}
                                                             
 resource "aws_key_pair" "terraform_key" {
   key_name = "terraform_server"
   public_key = file("~/.ssh/id_rsa.pub")
 }