variable "allow_ports" {
  type = list(any)
}

variable "cidr_ingress" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "common_tags" {
  type = map(any)
}

variable "environment" {
  type = string
}