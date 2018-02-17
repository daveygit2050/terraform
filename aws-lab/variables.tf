variable "name" {
  default = "gs-lab"
}

variable "region" {
  default = "eu-west-1"
}

variable "access-cidr" {
  default = "0.0.0.0/0"
  description = "Change this to allow traffic only from a specific source"
}

variable "az-suffixes" {
  type = "list"
  default = ["a", "b", "c"]
}

variable "public-cidrs" {
  type = "list"
  default = ["10.100.10.0/23", "10.100.12.0/23", "10.100.14.0/23"]
}

variable "private-cidrs" {
  type = "list"
  default = ["10.100.20.0/23", "10.100.22.0/23", "10.100.24.0/23"]
}

variable "vpc-cidr" {
  default = "10.100.0.0/16"
}
