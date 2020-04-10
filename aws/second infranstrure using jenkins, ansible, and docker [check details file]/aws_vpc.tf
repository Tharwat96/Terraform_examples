resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main_vpc"
  }
}