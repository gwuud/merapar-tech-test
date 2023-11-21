resource "aws_instance" "main" {
  ami             = data.aws_ami.amazonlinux2.id
  instance_type   = var.ec2_instance_type
  subnet_id       = element([for _, id in data.aws_subnets.subnets.ids : id], 0)
  security_groups = [aws_security_group.main.id]

  key_name = var.project_name

  user_data = file("./bootstrap.sh")

  provisioner "remote-exec" {
    inline = [
      ""
    ]
  }

  tags = {
    Name = "${var.project_name}-main"
  }
}

resource "aws_security_group" "main" {
  name   = var.project_name
  vpc_id = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.ec2_security_group_rules
    iterator = rule

    content {
      description = rule.value.description
      from_port   = rule.value.port
      to_port     = rule.value.port
      protocol    = "tcp"
      cidr_blocks = [rule.value.from_ip != "" ? "${rule.value.from_ip}/32" : "0.0.0.0/0"]
    }
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
