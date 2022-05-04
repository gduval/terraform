provider "aws" {
  profile = ""
  region = ""
}

terraform {
   backend "s3" {
     profile = ""
     bucket = ""
     key    = ""
     region = ""
   }
 }

data "aws_vpc" "vpc_name" {
 filter {
   name   = "tag:Name"
   values = ["vpc_name"]
 }
}


resource "aws_instance" "instance" {
  ami                         = ""
  count                       = var.instance_number
  instance_type               = var.instance_type
  iam_instance_profile        = ""
  key_name                    = ""
  vpc_security_group_ids      = [""]
  subnet_id                   = "${element(var.subnet_ids, count.index)}"
  root_block_device {
    volume_size               = var.volume_size
  }

  tags = {
    Name = "instance-identifier-${count.index}"
  }
}
