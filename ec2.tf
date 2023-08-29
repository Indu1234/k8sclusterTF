locals {
  instance_names = ["webserver"]
}

resource "aws_instance" "myec2vm" {
  count = length(local.instance_names)

  ami                    = data.aws_ami.Ubuntu.id # Using dynamic ami id for Ubuntu LTS 22.04
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    Name = local.instance_names[count.index]
  }
}
