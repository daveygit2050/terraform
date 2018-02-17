resource "aws_default_route_table" "default" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"

  tags {
    Name = "${var.name}-default"
  }
}


resource "aws_route_table" "private" {
  count = "${length(var.az-suffixes)}"
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
  count = "${length(var.az-suffixes)}"
  subnet_id = "${aws_subnet.private.*.id[count.index]}"
  route_table_id = "${aws_route_table.private.*.id[count.index]}"
}

resource "aws_route_table_association" "public" {
  count = "${length(var.az-suffixes)}"
  subnet_id = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.public.id}"
}
