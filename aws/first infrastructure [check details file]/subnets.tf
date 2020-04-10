resource "aws_subnet" "subnet_public_a" {
  vpc_id                  = "${aws_vpc.main_vpc.id}"
  cidr_block              = "10.10.10.0/24"
  map_public_ip_on_launch = "true" //it will make this a public subnet
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "subnet_public_a"
  }
}
resource "aws_subnet" "subnet_public_b" {
  vpc_id                  = "${aws_vpc.main_vpc.id}"
  cidr_block              = "10.10.20.0/24"
  map_public_ip_on_launch = "true" //it will make this a public subnet
  availability_zone       = "${var.AWS_REGION}b"
  tags = {
    Name = "subnet_public_b"
  }
}


resource "aws_subnet" "subnet_private_a" {
  vpc_id            = "${aws_vpc.main_vpc.id}"
  cidr_block        = "10.10.30.0/24"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "subnet_private_a"
  }
}
resource "aws_subnet" "subnet_private_b" {
  vpc_id            = "${aws_vpc.main_vpc.id}"
  cidr_block        = "10.10.40.0/24"
  availability_zone = "${var.AWS_REGION}b"
  tags = {
    Name = "subnet_private_b"
  }
}
