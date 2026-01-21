variable "cidr_egress" {
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