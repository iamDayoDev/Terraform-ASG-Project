# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "hft-igw" {
  vpc_id = aws_vpc.hft-vpc.id

  tags = {
    Name = var.igw-name
  }
}

# Create an Elastic IP address
resource "aws_eip" "ngw-eip" {
  domain = "vpc"
}

# Create a NAT gateway and associate it with an Elastic IP and a public subnet
resource "aws_nat_gateway" "hft-ngw" {
  allocation_id = aws_eip.ngw-eip.id     # Associate the NAT gateway with the Elastic IP
  subnet_id     = aws_subnet.pub-sub1.id # Associate the NAT gateway with a public subnet

  tags = {
    Name = var.nat-gw-name
  }

  depends_on = [aws_internet_gateway.hft-igw] # Make sure the internet gateway is created before creating the NAT gateway
}