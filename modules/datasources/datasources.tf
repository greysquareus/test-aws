####--------------------------DATASOURCE--------------------------####

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-*/ubuntu-noble-24.04-amd64-server-*"]
  }
  tags = merge(var.common_tags, { datassource_ami_for = "ubuntu" }, { environment = "${var.environment}" })
}

