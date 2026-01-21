####Common###

variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "environment" {
  default = "dev"
}
#-----------------------------

#Ingress and egress

variable "ingress_ports" {
  default = [22, 80, 443, 21]
}

variable "igress_rules" {
  default = "0.0.0.0/0"
}

variable "egress_rules" {
  default = "0.0.0.0/0"
}

#--------

variable "common_tags" {
  type = map(string)
  default = {
    Owner   = "Greysquare"
    Project = "Zemphius"
  }
}
