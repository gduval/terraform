variable "ami" {
  type = map

  default = {
    "us-east-2" = "ami-064ff912f78e3e561"
  }
}

variable "instance_number" {
  default = "5"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "volume_size" {
  default = "20"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "subnet_ids" {
  default =  [ "subnet-005e409ba19724db3", "subnet-0f8f9d69ae2e58e78", "subnet-0c73a144a4c5918ca" ]
}
