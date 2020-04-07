resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = "2048"

  provisioner "local-exec" {
    command = "echo $'${tls_private_key.keypair.private_key_pem}' >> private_key.pem"
  }

}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${tls_private_key.keypair.public_key_openssh}"
}
