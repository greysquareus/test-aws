variable "instance_type" {
  type = string
}

variable "ubuntu_ami" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map
}

variable "sec_group" {
}