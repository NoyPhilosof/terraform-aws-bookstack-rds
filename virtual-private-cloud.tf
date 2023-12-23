# Create a new VPC
resource "aws_vpc" "vpc-lesson9" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-lesson9"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw-lesson9" {
  vpc_id = aws_vpc.vpc-lesson9.id

  tags = {
    Name = "igw-lesson9"
  }
}

# Create first subnet in vpc-lesson9
resource "aws_subnet" "use1a-lesson9" {
  vpc_id            = aws_vpc.vpc-lesson9.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "use1a-lesson9"
  }
}

# Create second subnet in vpc-lesson9
resource "aws_subnet" "use1c-lesson9" {
  vpc_id            = aws_vpc.vpc-lesson9.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "use1c-lesson9"
  }
}