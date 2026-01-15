####--------------------------INSTANCE--------------------------####


resource "aws_instance" "master" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  tags = merge(var.common_tags, {instance = "master"})
}


resource "aws_instance" "worker1" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  tags = merge(var.common_tags, {instance = "worker1"})
}

resource "aws_instance" "worker2" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  tags = merge(var.common_tags, {instance = "worker2"}, {environment = "${var.environment}"})
}