resource "aws_security_group" "own_sec_group" {
  name = "webserver_sg"

  tags = merge(var.common_tags, { Security_group_name = "own_sec_group" })
}

