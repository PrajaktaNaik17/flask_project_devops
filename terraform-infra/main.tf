# Specify the AWS provider
provider "aws" {
  region = "ap-south-1"
}

# Create a security group allowing HTTP access
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP inbound traffic"
  ingress {
    from_port   = 80
    to_port     = 80
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

# Provision an EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-002b73f3a78e9089a"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "DevOpsWebApp"
  }
}

