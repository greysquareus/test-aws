
resource "aws_vpc_security_group_ingress_rule" "webserver_ingress_rule" {
  for_each          = toset([for port in var.allow_ports : tostring(port)])
  security_group_id = var.sg_id
  cidr_ipv4         = var.cidr_ingress
  from_port         = tonumber(each.value)
  ip_protocol       = "tcp"
  to_port           = tonumber(each.value)
}