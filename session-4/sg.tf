resource "aws_security_group" "first_sg" {        # Second label is a Logical Name for your code
  name        = "session-4"                       # Argument, this is a name for your resource
  description = "This is for testing"

  ingress {                                     # Ingress vs Egress ???
    description = "this is rule for session-3"  # Security group is stateful, meaning that, whatever port you define in ingress will apply to egress
    from_port   = 22                            # 1 2 3 4 5 6 ..... 443 = total 444 ports open
    to_port     = 22                            # [] = list
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {                                     # Ingress vs Egress ???
  description = "this is HTTP"  # Security group is stateful, meaning that, whatever port you define in ingress will apply to egress
  from_port   = 80                           # 1 2 3 4 5 6 ..... 443 = total 444 ports open
  to_port     = 80                           # [] = list
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                         # -1 means ALL protocols, TCP, UDP, ICMP
    cidr_blocks = ["0.0.0.0/0"]
  }
}