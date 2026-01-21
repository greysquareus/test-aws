output "master-public_ip" {
  value = aws_instance.master.public_ip
}

output "master-public_dns" {
  value = aws_instance.master.public_dns
}


output "worker-1-public_ip" {
  value = aws_instance.worker1.public_ip
}

output "worker-1-public_dns" {
  value = aws_instance.worker1.public_dns
}


output "worker-2-public_ip" {
  value = aws_instance.worker2.public_ip
}

output "worker-2-public_dns" {
  value = aws_instance.worker2.public_dns
}

###--------

output "instance_details" {
  value = [
    aws_instance.master,
    aws_instance.worker1,
    aws_instance.worker2
  ]
}
