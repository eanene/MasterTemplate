
resource "aws_vpc" "devVPC" {
  cidr_block       = var.vpcCIDR
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}



