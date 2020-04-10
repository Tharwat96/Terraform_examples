provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "aws"
  region                  = "${var.AWS_REGION}"

}
