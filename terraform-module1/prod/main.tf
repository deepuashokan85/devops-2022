module "aws_web" {
  source           = "../modules/ec2"
  ami_id	   = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-05ee79ab272912b76"
  count_id	   = 2
  tag    	   = "prod-balaji-web"
}

module "aws_app" {
  source           = "../modules/ec2"
  ami_id           = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-05ee79ab272912b76"
  count_id            = 3
  tag              = "prod-balaji-app"
}

module "aws_db" {
  source           = "../modules/ec2"
  ami_id           = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-05ee79ab272912b76"
  count_id            = 1
  tag              = "prod-balaji-db"
}
