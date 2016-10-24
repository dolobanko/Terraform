resource "aws_db_instance" "default" {
  depends_on             = ["aws_security_group.default"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  storage_type		 = "${var.storage_type}"
  multi_az		 = "${var.multi_az}"
  publicly_accessible	 = "${var.pub_access}"
  backup_retention_period = "${var.retention_period}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  license_model		 = "${var.license_mod}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
}

resource "aws_db_subnet_group" "default" {
  name        = "rds_sg"
  description = "RDS security group"
  subnet_ids  = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_1_cidr}"
  availability_zone = "${var.az_1}"

  tags {
    Name = "RDS_subnet_1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_2_cidr}"
  availability_zone = "${var.az_2}"

  tags {
    Name = "RDS_subnet_2"
  }
}

resource "aws_security_group" "default" {
  name        = "RDS_SG"
  description = "RDS security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "RDS_SG"
  }
}
