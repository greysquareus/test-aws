#-----------------------

##Master
resource "tls_private_key" "master_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_master" {
  content         = tls_private_key.master_ssh.private_key_pem
  filename        = "${path.module}/.ssh/id_rsa_master"
  file_permission = "0600"
}

resource "aws_key_pair" "master_ssh" {
  key_name   = "master-ssh-key"
  public_key = tls_private_key.master_ssh.public_key_openssh
}

#-------------------------------

##Worker1
resource "tls_private_key" "worker_1_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_worker_1" {
  content         = tls_private_key.worker_1_ssh.private_key_pem
  filename        = "${path.module}/.ssh/id_rsa_worker1"
  file_permission = "0600"
}

resource "aws_key_pair" "worker1_ssh" {
  key_name   = "worker-1-ssh-key"
  public_key = tls_private_key.worker_1_ssh.public_key_openssh
}

#-----------------------

##Worker2
resource "tls_private_key" "worker_2_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_worker_2" {
  content         = tls_private_key.worker_2_ssh.private_key_pem
  filename        = "${path.module}/.ssh/id_rsa_worker2"
  file_permission = "0600"
}

resource "aws_key_pair" "worker2_ssh" {
  key_name   = "worker-2-ssh-key"
  public_key = tls_private_key.worker_2_ssh.public_key_openssh
}

#-----------------------------------
