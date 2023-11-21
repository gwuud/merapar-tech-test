resource "aws_instance" "main" {
  ami             = data.aws_ami.amazonlinux2.id
  instance_type   = var.ec2.instance_type
  subnet_id       = element([for _, id in data.aws_subnets.subnets.ids : id], 0)
  security_groups = [aws_security_group.main.id]

  tags = {
    Name = "${var.project.name}-main"
  }
}

resource "aws_security_group" "main" {
  name        = var.project.name
  description = "Allow ${upper(var.network.protocol)}"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "${upper(var.network.protocol)} Inbound"
    from_port   = var.network.port
    to_port     = var.network.port
    protocol    = "tcp"
    cidr_blocks = [var.network.allowed_ip != "" ? "${var.network.allowed_ip}/32" : "0.0.0.0/0"]
  }
}
