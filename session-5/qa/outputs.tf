output "first_ec2_ip" {
    value = aws_instance.first_ec2.public_ip           # Reference to Resource
}
