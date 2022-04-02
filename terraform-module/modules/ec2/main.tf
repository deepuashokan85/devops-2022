resource "aws_instance" "devops-2022" {
  ami           = var.ami_id
  instance_type = var.inst_type
  subnet_id   = var.sub_id
  count = var.count_id

  tags = {
    Name = var.tag
  }
}
