provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "lab" {
  cidr_block = "10.100.0.0/16"

  tags {
    Name = "lab"
  }
}

resource "aws_subnet" "public-a1" {
  availability_zone = "${var.region}a"
  cidr_block = "10.100.0.0/23"
  vpc_id = "${aws_vpc.lab.id}"


  tags {
    Name = "public-a1"
  }
}
