variable "project_name" {
  type = string
  default = "project"
}

variable "ec2_instance_type" {
  type = string
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
      description = "Allow 8080/tcp"
      port        = 8080
      from_ip     = "95.150.60.49"
    },
    {
      description = "Allow 22/tcp"
      port        = 22
      from_ip     = "95.150.60.49"
  }]
}
