resource "aws_internet_gateway" "aws_gateway" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  tags = {
    Name = "aws_gateway"
  }
}
# virtual private gateway
resource "aws_vpn_gateway" "aws_private_gateway" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  tags = {
    Name = "private_gateway"
  }
}


resource "aws_route_table" "aws_public_route_table" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = "${aws_internet_gateway.aws_gateway.id}"
  }
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "aws_private_route_table" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  route {
    cidr_block = "255.255.255.0/24"
    gateway_id = "${aws_vpn_gateway.aws_private_gateway.id}"

  }
  tags = {
    Name = "private_route_table"
  }
}


resource "aws_route_table_association" "private_route_private_subnet_a" {
  subnet_id      = "${aws_subnet.subnet_private_a.id}"
  route_table_id = "${aws_route_table.aws_private_route_table.id}"
}

resource "aws_route_table_association" "private_route_private_subnet_b" {
  subnet_id      = "${aws_subnet.subnet_private_b.id}"
  route_table_id = "${aws_route_table.aws_private_route_table.id}"
}

resource "aws_route_table_association" "public_route_public_subnet_a" {
  subnet_id      = "${aws_subnet.subnet_public_a.id}"
  route_table_id = "${aws_route_table.aws_public_route_table.id}"
}

resource "aws_route_table_association" "public_route_public_subnet_b" {
  subnet_id      = "${aws_subnet.subnet_public_b.id}"
  route_table_id = "${aws_route_table.aws_public_route_table.id}"
}
