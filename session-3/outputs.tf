output "first_ec2_ip" {
    value = aws_instance.first_ec2.public_ip           # Reference to Resource
}

output "second_ec2_ip" {
    value = aws_instance.second_ec2.public_ip          # Reference to Resource
}