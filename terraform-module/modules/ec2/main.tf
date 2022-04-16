resource "aws_instance" "devops-2022" {
  cidr_id             = var.cidr_id
  azs_id              = var.azs_id
  private_subnets_id  = var.private_subnets_id
  public_subnets_id   = var.public_subnets_id
  igw_id              = var.igw_id
  ngw_id              = var.ngw_id
  route_id            = var.route_id
  count_id            = var.count_id  
  security_groups_id  = var.security_groups_id
  bucket_id           = var.bucket_id
  ami_id              = var.ami_id
  instance_type       = var.inst_type
  subnet_id           = var.sub_id
  count               = var.count_id
  vpc_id              = var.vpc_id
  tags = {
    Name = var.tag
  }
}
