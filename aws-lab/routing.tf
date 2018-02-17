resource "aws_route_table" "private" {
  count = 3
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ng.*.id[count.index]}"
  }

  tags {
    Name = "${var.name}-private-${element(var.az-suffixes, count.index)}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name = "${var.name}-public"
  }
}

resource "aws_route_table_association" "private" {
  count = 3
  subnet_id = "${aws_subnet.private.*.id[count.index]}"
  route_table_id = "${aws_route_table.private.*.id[count.index]}"
}

resource "aws_route_table_association" "public" {
  count = 3
  subnet_id = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.public.id}"
}
