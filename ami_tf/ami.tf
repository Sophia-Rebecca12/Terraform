provider "aws" {
  region = "us-east-1"
}

resource "aws_ami_from_instance" "terraform" {
  name               = "terraform"
  source_instance_id = "i-0c5479d24ac6d4482"
}