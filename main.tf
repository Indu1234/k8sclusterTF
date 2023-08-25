terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "my_keypair" {
  key_name   = "k8s-keypair"
  public_key = file("~/.ssh/k8s.pub")
}

locals {
  instance_names = ["k8s-master", "k8s-node1", "k8s-node2"]
}

resource "aws_instance" "ec2_instance" {
  count = length(local.instance_names)

  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_keypair.key_name
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    Name = local.instance_names[count.index]
  }
}
