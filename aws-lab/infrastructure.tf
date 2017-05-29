provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.100.0.0/16"

  tags {
    Name = "${terraform.env}"
  }
}

resource "aws_subnet" "subnet-public-a1" {
  availability_zone = "${var.region}a"
  cidr_block = "10.100.0.0/23"
  vpc_id = "${aws_vpc.vpc.id}"


  tags {
    Name = "${terraform.env}-public-a1"
  }
}
