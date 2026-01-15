
resource "aws_vpc_security_group_egress_rule" "webserver_egress_rule" {
  security_group_id = var.sg_id
  cidr_ipv4         = var.cidr_egress
  ip_protocol       = "-1"
}