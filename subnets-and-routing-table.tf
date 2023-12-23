# Create routing table
resource "aws_route_table" "rt-lesson9" {
  vpc_id = aws_vpc.vpc-lesson9.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-lesson9.id
  }

  tags = {
    Name = "rt-lesson9"
  }
}

# Associate with use1a-lesson9 subnet
resource "aws_route_table_association" "a-lesson9-use1a" {
  subnet_id      = aws_subnet.use1a-lesson9.id
  route_table_id = aws_route_table.rt-lesson9.id
}

# Associate with use1c-lesson9 subnet
resource "aws_route_table_association" "a-lesson9-use1c" {
  subnet_id      = aws_subnet.use1c-lesson9.id
  route_table_id = aws_route_table.rt-lesson9.id
}