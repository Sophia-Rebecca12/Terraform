provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "Demo" {
  ami           = "ami-00b53952597e06220"
  instance_type = "t2.nano"
  key_name = "virtusasystemprivatekey"
  subnet_id = "subnet-016d997f5abe4cb51"
  vpc_security_group_ids = ["sg-07c693a8038c2723c"]
  tags = {
    Name = "terraformtest"
  }
  user_data = filebase64("${path.module}/userdata.sh")
}
