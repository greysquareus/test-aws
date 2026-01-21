###--------

output "instance_details" {
  value = [
    aws_instance.master,
    aws_instance.worker1,
    aws_instance.worker2
  ]
}
