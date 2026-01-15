provider "aws" {
  region = "us-east-2"
}

module "instances" {
  source = "./modules/instances"
  instance_type = var.instance_type
  ubuntu_ami = module.datasources.ubuntu_id
  environment = var.environment
}

module "datasources" {
  source = "./modules/datasources"
  environment = var.environment
}

module "sec_group" {
  source = "./modules/network/sec_group"
}

module "ingress_rules" {
  source = "./modules/network/ingress_rules"
  cidr_ingress = var.igress_rules
  allow_ports = var.ingress_ports
  sg_id = module.sec_group.sg_id
}

module "egress_rules" {
  source = "./modules/network/egress_rules"
  cidr_egress = var.egress_rules
  sg_id = module.sec_group.sg_id
}