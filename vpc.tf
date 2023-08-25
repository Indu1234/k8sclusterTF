resource "aws_vpc" "k8s_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "nodepool_subnet" {
  vpc_id     = aws_vpc.k8s_vpc.id
  cidr_block = "10.0.1.0/24"
}
