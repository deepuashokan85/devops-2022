module "aws_network" {
  resource "aws_vpc" "my_vpc" {
  cidr = "192.64.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["192.64.4.0/24", "192.64.5.0/24", "192.64.6.0/24"]
  public_subnets  = ["192.64.1.0/24", "192.64.2.0/24", "192.64.3.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = true
  tags = "dev-balaaji-vpc"
 }

  resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "192.64.10.0/24"
  availability_zone = "us-east-2a"
  tags = "dev-balaaji-subnet"
 }

  resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = "dev-balaaji-igw"
 }

  resource "aws_nat_gateway" "my_nat_gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.my_subnet.id
  tags = "dev-balaaji-ngw"
 }

  resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "192.64.0.0/16"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.my_igw.id
  }
  tags = "dev-balaaji-rt"
  }

module "aws_loadbalancer" {
  resource "aws_lb" "my_lb" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]
  enable_deletion_protection = true
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
  tags = "dev-balaaji-lb"
  }
}
}

module "aws_ec2" {
  source           = "../modules/ec2"
  ami_id           = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-05ee79ab272912b76"
  count_id         = 1
  tag              = "dev-balaji-ec2"
}

module "aws_sg" {
  resource "aws_sg" "my_sg" {
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
  tags = "dev-balaji-sg"
  }
}
