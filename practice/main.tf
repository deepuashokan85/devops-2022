resource "aws_instance" "test" {
 ami	= var.ami_id
 instance_type	= var.inst_type
 subnet_id	= var.sub_id
 count	= 2

 tags = {
  Name = "kavitha-terraform"
 } 
}

resource "aws_security_group" "kavitha-sg" {
 name = "kavitha-sg"
 description = "Allow TLS inbound traffic"
 vpc_id = "vpc-06619b9a4856571a7"
 
 ingress {
  description = "TLS from vpc"
  from_port = 443
  to_port = 443 
  protocol = "tcp"
  cidr_block = ["10.10.0.0/32"]
 }

 egress {
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_block = ["0.0.0.0/0"]
 }

 tags = {
  Name = "allow http"
 }
}

