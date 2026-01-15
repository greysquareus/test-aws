####--------------------------INSTANCE--------------------------####


resource "aws_instance" "master" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
}


resource "aws_instance" "worker1" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
}

resource "aws_instance" "worker2" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
}