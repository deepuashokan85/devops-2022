resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "terraform-Demo-vpc"
  }
}

resource "aws_subnet" "my_subnet01" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-demo-subnet01"
  }
}

resource "aws_subnet" "my_subnet02" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "tf-demo-subnet02"
  }
}

resource "aws_internet_gateway" "test-igw"
   vpc_id = aws_vpc.my_vpc.id
   

   tags = {
     Name = "test-igw"
   }
}

resource "aws_routetable" "test_rt" {
   vpc_id = aws_vpc.my_vpc.id
   
   route {
      cidr_block = "10.0.0.0/0"
      internet_gw = aws_internet_gateway.test_iqw.id
   }
}

resource "route_table_association" "test_rta" {
   subnet_id = "aws_subnet.my_subnet01
   route_table = aws_routetable.test_rt.id

}



resource "security_group" "ssh_allowed" {
   vpc_id = "aws_vpc.my_vpc.id"
   
   egress {
	to_port=0
        from_port=0
	protocol = -1
        cidr_block = "0.0.0.0/0"
  }

  ingress {
        to_port = 22
        from_pory = 22
        protocol = tcp
        cidr_block = "0.0.0.0/0"
 }
  
tags = {
  name = "security_group"
 }
}

//instance creation
resource "ec2_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.inst_type
  subnet_id = aws_subnet.my_subnet01.id
  security_group = security_group.ssh_allowed.id

   tags = {
      name = "kavitha_instance"
  }
}

        

