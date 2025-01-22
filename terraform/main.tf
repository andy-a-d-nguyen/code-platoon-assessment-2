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

output "instance_ip" {
  value = aws_instance.ubuntu_server.public_ip
}
