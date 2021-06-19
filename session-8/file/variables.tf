# This is a file where you will be putting all your INPUT variables or PARAMETERS

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "This is an instance type for EC2"
}

variable "env" {
    type = string
    default = "qa"
    description = "This is a variable for environments"
}

variable "sg_tcp_ports" {
    type = list(string)
}

variable "sg_tcp_ports_cidr" {
    type = list(string)
}