resource "aws_security_group" "web" { # Second label is a Logical Name for your code
  name        = "${var.env}-web"      # Argument, this is a name for your resource
  description = "This is for web instance, launch_configuration"

  ingress {
    description = "This is for SSH ing"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "This is for Apache"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "ALL PORTS and PROTOCOLS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" { # Second label is a Logical Name for your code
  name        = "${var.env}-alb-sg"      # Argument, this is a name for your resource
  description = "This is for application load balancer, ALB"

  ingress {
    description = "This is for Apache"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "ALL PORTS and PROTOCOLS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Element + Count.Index 
# Save some lines in the code, nothing else