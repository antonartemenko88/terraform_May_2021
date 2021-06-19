resource "aws_launch_configuration" "web-1" {
  name            = "${var.env}-web-lc-1"
  image_id        = data.aws_ami.amazon_linux_2.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web.id]
  key_name        = aws_key_pair.terraform-server.key_name
  user_data       = data.template_file.user_data.rendered
}