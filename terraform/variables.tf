variable "project_name" {}

variable "ec2_instance_type" {
  default = "t3.micro"
}

variable "ec2_security_group_rules" {
  type = list(object({
    description = string
    port        = number
    from_ip     = string
  }))
  default = [
    {
      description = "Allow Custom Inbound"
      port        = 8080
      from_ip     = "95.150.60.49"
    },
    {
      description = "Allow Ansible SSH"
      port        = 22
      from_ip     = "95.150.60.49"
  }]
}
