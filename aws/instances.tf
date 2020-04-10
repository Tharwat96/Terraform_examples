# public instances
resource "aws_instance" "first_public_ec2" {
  ami                    = "ami-0c322300a1dd5dc79"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.deployer.id}"
  subnet_id              = "${aws_subnet.subnet_public_a.id}"
  availability_zone      = "${var.az-1}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  tags = {
    Name = "first_public_ec2"
  }

}
output "first_public_ec2_instance_dns_addr" {
  value       = "${aws_instance.first_public_ec2.public_dns}"
  description = "The public DNS address of first_public_ec2 instance."
}

output "first_public_ec2_instance_ip_addr" {
  value       = "${aws_instance.first_public_ec2.public_ip}"
  description = "The public ip address of first_public_ec2 instance."
}

resource "aws_instance" "second_public_ec2" {
  ami                    = "ami-0c322300a1dd5dc79"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.deployer.id}"
  subnet_id              = "${aws_subnet.subnet_public_b.id}"
  availability_zone      = "${var.az-2}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  tags = {
    Name = "second_public_ec2"
  }
}

output "second_public_ec2_instance_dns_addr" {
  value       = "${aws_instance.second_public_ec2.public_dns}"
  description = "The public DNS address of second_public_ec2 instance."
}
output "second_public_ec2_instance_ip_addr" {
  value       = "${aws_instance.second_public_ec2.public_ip}"
  description = "The public ip address of second_public_ec2 instance."
}

# private instances
resource "aws_instance" "first_private_ec2" {
  ami                    = "ami-0c322300a1dd5dc79"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.deployer.id}"
  subnet_id              = "${aws_subnet.subnet_private_a.id}"
  availability_zone      = "${var.az-1}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  tags = {
    Name = "first_private_ec2"
  }

}
output "first_private_ec2_instance_ip_addr" {
  value       = "${aws_instance.first_private_ec2.private_ip}"
  description = "The private ip address of first_private_ec2 instance."
}

resource "aws_instance" "second_private_ec2" {
  ami                    = "ami-0c322300a1dd5dc79"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.deployer.id}"
  subnet_id              = "${aws_subnet.subnet_private_b.id}"
  availability_zone      = "${var.az-2}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  tags = {
    Name = "second_private_ec2"
  }
}
output "second_private_ec2_instance_ip_addr" {
  value       = "${aws_instance.second_private_ec2.private_ip}"
  description = "The private ip address of second_private_ec2 instance."
}
# bastion instance
resource "aws_instance" "bastion" {
  ami                    = "ami-0c322300a1dd5dc79"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.deployer.id}"
  subnet_id              = "${aws_subnet.subnet_public_a.id}"
  availability_zone      = "${var.az-1}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]

  tags = {
    Name = "bastion"
  }

}
output "bastion_instance_dns_addr" {
  value       = "${aws_instance.bastion.public_dns}"
  description = "The public DNS address of bastion instance."
}
output "bastion_instance_ip_addr" {
  value       = "${aws_instance.bastion.public_ip}"
  description = "The public ip address of bastion instance."
}