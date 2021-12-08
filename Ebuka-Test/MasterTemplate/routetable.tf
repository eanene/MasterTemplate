resource "aws_route_table" "pubRT" {
  vpc_id = aws_vpc.devVPC.id
 
}

resource "aws_route" "internet_route" {
route_table_id = aws_route_table.pubRT.id
destination_cidr_block    = "0.0.0.0/0"
gateway_id = aws_internet_gateway.devIGW.id
  depends_on              = [aws_internet_gateway.devIGW]
}


resource "aws_route_table_association" "subnetAssoc" {
  subnet_id      = aws_subnet.devpublicsubnet.id
  route_table_id = aws_route_table.pubRT.id
}

