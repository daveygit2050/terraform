resource "aws_security_group" "bastions" {
  description = "Applied to ${var.name} bastion servers"
  name = "${var.name}-bastions"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    description = "Allow inbound traffic from Gold Square IT HQ"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.access-cidr}"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-bastions"
  }
}

resource "aws_security_group" "private" {
  description = "Applied to ${var.name} private servers"
  name = "${var.name}-private"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    description = "Allow inbound SSH from bastion servers"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = ["${aws_security_group.bastions.id}"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-private"
  }
}
