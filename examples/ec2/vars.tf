variable "ami" {
  type = map

  default = {
    "us-east-2" = ""
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
  default =  [ "", "", "" ]
}
