resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_subnet" "public-subnets" {
  availability_zone = "${var.region}${element(var.az-suffixes, count.index)}"
  cidr_block = "${element(var.public-cidrs, count.index)}"
  count = 3
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}-public-${element(var.az-suffixes, count.index)}"
    Type = "public"
  }
}

resource "aws_subnet" "private-subnets" {
  availability_zone = "${var.region}${element(var.az-suffixes, count.index)}"
  cidr_block = "${element(var.private-cidrs, count.index)}"
  count = 3
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}-private-${element(var.az-suffixes, count.index)}"
    Type = "private"
  }
}
