resource "aws_launch_template" "terratest" {
  name = "terratest"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  iam_instance_profile {
    name = "ecsInstanceRole"
  }

  image_id = "ami-0142bed01cc1df5f3"

  instance_market_options {
    market_type = "spot"
  }

  network_interfaces {
    associate_public_ip_address = true
  }


  instance_type = "t2.nano"

  key_name = "virtusasystemprivatekey"
  placement {
    availability_zone = "us-east-1a"
  }

  vpc_security_group_ids = ["sg-07c693a8038c2723c"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "terraformtest"
    }
  }

  user_data = filebase64("${path.module}/userdata.sh")
}