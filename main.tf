provider "aws" {
  region = var.region
}

module "instances" {
  source        = "./modules/instances"
  instance_type = var.instance_type
  ubuntu_ami    = module.datasources.ubuntu_id
  environment   = var.environment
  common_tags   = var.common_tags
  sec_group     = module.sec_group.sg_id
}

module "datasources" {
  source      = "./modules/datasources"
  common_tags = var.common_tags
  environment = var.environment
}

module "sec_group" {
  source      = "./modules/network/sec_group"
  common_tags = var.common_tags
  environment = var.environment
}

module "ingress_rules" {
  source       = "./modules/network/ingress_rules"
  cidr_ingress = var.igress_rules
  allow_ports  = var.ingress_ports
  sg_id        = module.sec_group.sg_id
  common_tags  = var.common_tags
  environment  = var.environment
}

module "egress_rules" {
  source      = "./modules/network/egress_rules"
  cidr_egress = var.egress_rules
  sg_id       = module.sec_group.sg_id
  common_tags = var.common_tags
  environment = var.environment
}