####--------------------------INSTANCE--------------------------####


resource "aws_instance" "master" {
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.master_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, { instance = "master" })

  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_instance" "worker1" {
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.worker1_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, { instance = "worker1" }, { environment = "${var.environment}" })
}

resource "aws_instance" "worker2" {
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.worker2_ssh.key_name
  vpc_security_group_ids = [var.sec_group]
  # user_data = filebase64()

  tags = merge(var.common_tags, { instance = "worker2" }, { environment = "${var.environment}" })
}

####--------------------------ANSIBLE INVENTORY--------------------------####

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    master_ip       = aws_instance.master.public_ip
    master_key      = "${path.module}/.ssh/id_rsa_master"
    worker1_ip      = aws_instance.worker1.public_ip
    worker1_key     = "${path.module}/.ssh/id_rsa_worker1"
    worker2_ip      = aws_instance.worker2.public_ip
    worker2_key     = "${path.module}/.ssh/id_rsa_worker2"
  })
  filename = "${path.module}/inventory.yaml"
}

####--------------------------PROVISIONING--------------------------####

resource "null_resource" "instance_provisioning" {
    depends_on = [
    local_file.ansible_inventory,
    local_file.ssh_private_key_master,
    local_file.ssh_private_key_worker_1,
    local_file.ssh_private_key_worker_2
  ]

  triggers = {
    master_id  = aws_instance.master.id
    worker1_id = aws_instance.worker1.id
    worker2_id = aws_instance.worker2.id
    inventory  = local_file.ansible_inventory.content
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<EOT
        sleep 30
        ansible-playbook -i modules/instances/inventory.yaml \
        -u ubuntu \
        --private-key modules/instances/.ssh/id_rsa_master \
        --ssh-common-args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null' \
        modules/instances/scripts/provision.yml
    EOT
  }
}
