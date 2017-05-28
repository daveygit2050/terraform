variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-80861296"
    "us-west-2" = "ami-efd0428f"
  }
}
