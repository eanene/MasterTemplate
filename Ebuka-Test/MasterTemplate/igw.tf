resource "aws_internet_gateway" "devIGW" {
  vpc_id = aws_vpc.devVPC.id

  tags = {
    Name = "dev-igw"
  }
}