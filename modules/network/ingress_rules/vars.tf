variable "allow_ports" {
  type    = list(any)
  default = [22, 80, 443]
}

variable "cidr_ingress" {
  type = string
}

variable "sg_id" {
  type = string
}