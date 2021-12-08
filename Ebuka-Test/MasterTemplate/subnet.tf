resource "aws_subnet" "devpublicsubnet" {
  vpc_id     = aws_vpc.devVPC.id
  cidr_block = var.pubsubCIDR
  availability_zone = var.AZ
  tags = {
    Name = "dev-pub-subnet"
  }
}
