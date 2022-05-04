terraform {
  backend "s3" {
    profile = ""
    region = "us-east-2"
    bucket = ""
    key    = ""
  }
}

provider "" {
  profile = ""
  region = ""
}

data "aws_vpc" "vpc_name" {
  filter {
    name   = "tag:Name"
    values = ["vpc_name"]
  }
}

resource "aws_db_instance" "master" {
  allocated_storage      =
  db_subnet_group_name   = ""
  engine                 = "postgres"
  engine_version         = ""
  identifier             = ""
  instance_class         = ""
  password               =  ""
  iops                   = 4750
  skip_final_snapshot    = true
  storage_encrypted      = true
  db_name                   = ""
  vpc_security_group_ids = [""]
  enabled_cloudwatch_logs_exports = [""]
  username               = "postgres"
  deletion_protection    = true
  multi_az               = true
  backup_window          = "00:00-03:00"
  backup_retention_period = 7
  port                   = 5432
}

resource "aws_db_instance" "replica" {
  replicate_source_db             = ""
  iops                            = 4750
  max_allocated_storage           = 1000
  identifier                      = "prod-mi-rds-replica"
  instance_class                  = "db.r6g.4xlarge"
  performance_insights_enabled    = true
  enabled_cloudwatch_logs_exports = ["postgresql"]
  storage_encrypted               = true
  deletion_protection             = true
  multi_az                        = true
  backup_window                   = "00:00-03:00"
  backup_retention_period = 0
  port                 = 5432
}

resource "aws_security_group" "rds" {
  name   = ""
  vpc_id = data.vpc_name.id

  tags = {
    Name = ""
  }
}

resource "aws_security_group_rule" "rds_ingress_cidr_blocks" {

  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "-1"
  cidr_blocks       = [""]
  security_group_id = ""
}

resource "aws_security_group_rule" "rds_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-0f81aaa00a6973c28"
}
