####--------------------------INSTANCE--------------------------####


resource "aws_instance" "master" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = aws_key_pair.master_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, {instance = "master"})
}


resource "aws_instance" "worker1" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = aws_key_pair.worker1_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, {instance = "worker1"}, {environment = "${var.environment}"})
}

resource "aws_instance" "worker2" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  key_name = aws_key_pair.worker2_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, {instance = "worker2"}, {environment = "${var.environment}"})
}




