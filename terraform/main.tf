 ami           = "ami-0c293f3f676ec4f90"
  instance_type = "t2.micro"
  subnet_id   = "subnet-0011853534e832e2c"
  count = 5

  tags = {
    Name = "pradeep-terraform"
  }
}
