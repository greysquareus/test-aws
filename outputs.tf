output "instance_summary" {
  value = [
    for inst in module.instances.instance_details : {
      id   = inst.id
      ip   = inst.public_ip
      az   = inst.availability_zone
      dns  = inst.public_dns
    }
  ]
}