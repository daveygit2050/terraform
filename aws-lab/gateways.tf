resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_eip" "ng" {
  count = 3
  vpc = true

  tags {
    Name = "${var.name}-nat-${element(var.az-suffixes, count.index)}"
  }
}

resource "aws_nat_gateway" "ng" {
  allocation_id = "${aws_eip.ng.*.id[count.index]}"
  count = 3
  subnet_id = "${aws_subnet.public.*.id[count.index]}"

  tags {
    Name = "${var.name}-${element(var.az-suffixes, count.index)}"
  }
}
