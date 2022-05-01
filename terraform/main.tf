resource "aws_instance" "devops-2022" {
  ami           = var.ami_id
  instance_type = var.inst_type
  subnet_id   = var.sub_id
  count = 4
  key_name = "Pradeep-keypair"
  associate_public_ip_address = true
  tags = {
    Name = "pradeep-terraform"
  }
}

resource "aws_security_group" "pradeep_sg" {
  name        = "pradeep_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-06619b9a4856571a7"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.10.10.10/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
