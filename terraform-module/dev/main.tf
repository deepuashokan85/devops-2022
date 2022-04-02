module "aws_web" {
  source           = "../modules/ec2"
  ami_id	   = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id	   = "subnet-09484583fb93f28db"
  count_id	           = 2
  tag    	   = "dev-pradeep-web"
}

module "aws_app" {
  source           = "../modules/ec2"
  ami_id           = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id           = "subnet-09484583fb93f28db"
  count_id            = 3
  tag              = "dev-pradeep-app"
}

module "aws_db" {
  source           = "../modules/ec2"
  ami_id           = "ami-0c02fb55956c7d316"
  inst_type        = "t2.micro"
  sub_id           = "subnet-09484583fb93f28db"
  count_id            = 1
  tag              = "dev-pradeep-db"
}
