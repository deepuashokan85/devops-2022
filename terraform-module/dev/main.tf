module "aws_network" {
  source = "../modules/ec2"
  cidr = "192.64.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["192.64.4.0/24", "192.64.5.0/24", "192.64.6.0/24"]
  public_subnets  = ["192.64.1.0/24", "192.64.2.0/24", "192.64.3.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = true
  igw_id = "igw-0c8db5797e30a89bd"
  ngw_id = "nat-0fc785c22a36a416b"
  route_id = "rtb-03b5fb9c4c98a9e67"
  count_id = 2
  tags = "dev-balaaji-vpc"
  }

module "aws_loadbalancer" {
  source = "../modules/ec2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "sg-0906822d667dabc45"
  subnets            = ["192.64.1.0/24", "192.64.2.0/24", "192.64.3.0/24"]
  count_id = 2
  enable_deletion_protection = true
  access_logs {
    bucket  = "balaji-bucket-statefile1"
    prefix  = "test-lb"
    enabled = true
  }
  tags = "dev-balaaji-lb"
}


module "aws_ec2" {
  source           = "../modules/ec2"
  ami_id           = "ami-03ededff12e34e59e"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-0bcd966a31abfb6c3"
  count_id         = 1
  tag              = "dev-balaaji-ec2"
}

module "aws_sg" {
  idescription = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0fe99ec612ea82f11"
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
  count_id         = 1
  tags = "dev-balaaji-sg"
  }

