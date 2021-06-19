resource "aws_key_pair" "terraform-server" {
  key_name   = "${var.env}-terraform-server"
  public_key = file("~/.ssh/id_rsa.pub")
}