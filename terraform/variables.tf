variable "project" {
  type = map(string)
}

variable "ec2" {
  type = map(string)
}

variable "network" {
  type = map(string)
  default = {
    "port" : 80
    "protocol" : "http"
    "allowed_ip" : "0.0.0.0/0"
  }
}
