resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "terraform-Demo-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-demo-subnet"
  }
}

resource "aws_network_interface" "net_demo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "demo_instance" {
  ami           = var.ami_id # us-west-2
  instance_type = var.inst_type

  network_interface {
    network_interface_id = aws_network_interface.net_demo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
