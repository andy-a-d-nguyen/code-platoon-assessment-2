provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ubuntu_security_group" {
  name        = "andy_ubuntu_security_group"
  description = "Andy Ubuntu Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = "andy-east1"

  security_groups = [
    aws_security_group.ubuntu_security_group.name
  ]

  tags = {
    Name = "Andy Ubuntu Server"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "andy"
  password             = "andyandy"
  db_name              = "todo_db"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Name = "Andy MySQL"
  }
}

output "instance_ip" {
  value = aws_instance.ubuntu_server.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
