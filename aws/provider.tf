
provider "aws" {
  profile    = "aws"
  region     = "${var.AWS_REGION}"
  # access_key = "${var.jenkins_aws_secret_key_id}"
  # secret_key = "${var.jenkins_aws_secret_access_key}"

}

