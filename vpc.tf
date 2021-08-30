resource "aws_vpc" "dev-vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev VPC"
  }
}

#create Internet Gateway and attach to Public Subnet
#dev Aws InternetGateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev IGW"
  }
}

# Create Public Subnet 1
# dev aws create subnet
resource "aws_subnet" "dev-public-subnet-1a" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-public-subnet-1a-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-subnet-1a"
  }
}

# Create Public Subnet 2
# dev aws create subnet
resource "aws_subnet" "dev-public-subnet-1b" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-public-subnet-1b-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-subnet-1b"
  }
}
resource "aws_subnet" "dev-public-subnet-1c" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-public-subnet-1c-cidr
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1c"
  }
}
# Create Route Table and Add Public Route
# dev aws create route table
resource "aws_route_table" "dev-public-route" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "dev-public-route"
  }
}
# Associate Public Subnet 1 to "Public Route Table"
# dev aws associate subnet with route table
resource "aws_route_table_association" "dev-public-subnet-1a-route-table-association" {
  subnet_id      = aws_subnet.dev-public-subnet-1a.id
  route_table_id = aws_route_table.dev-public-route.id
}
# Associate Public Subnet 2 to "Public Route Table"
# dev aws associate subnet with route table
resource "aws_route_table_association" "dev-public-subnet-1b-route-table-association" {
  subnet_id      = aws_subnet.dev-public-subnet-1b.id
  route_table_id = aws_route_table.dev-public-route.id
}
resource "aws_route_table_association" "dev-public-subnet-1c-route-table-association" {
  subnet_id      = aws_subnet.dev-public-subnet-1c.id
  route_table_id = aws_route_table.dev-public-route.id
}

# Create Private Subnet 1
# dev aws create subnet
resource "aws_subnet" "dev-private-subnet-1a" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-private-subnet-1a-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-private-subnet-1a"
  }
}
# Create Private Subnet 2
# dev aws create subnet
resource "aws_subnet" "dev-private-subnet-1b" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-private-subnet-1b-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-private-subnet-1b"
  }
}

resource "aws_subnet" "dev-private-subnet-1c" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-private-subnet-1c-cidr
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-private-subnet-1c"
  }
}
# Create Private Subnet 3
# dev aws create subnet
resource "aws_subnet" "dev-data-subnet-1a" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-data-subnet-1a-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-data-subnet-1a"
  }
}
# Create Private Subnet 4
# dev aws create subnet
resource "aws_subnet" "dev-data-subnet-1b" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-data-subnet-1b-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-data-subnet-1b"
  }
}
resource "aws_subnet" "dev-data-subnet-1c" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.dev-data-subnet-1c-cidr
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-data-subnet-1c"
  }
}
#create nat gate way
#create elp ip allocation nat gate  way

resource "aws_eip" "dev-eip" {
  vpc = true
}
resource "aws_nat_gateway" "dev-natgw" {
  allocation_id = aws_eip.dev-eip.id
  subnet_id     = aws_subnet.dev-public-subnet-1a.id

  tags = {
    Name = " dev-natgw"
  }
}

resource "aws_route_table" "dev-private-route" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.dev-natgw.id
  }

  tags = {
    Name = "dev-private-route"
  }
}
# Associate Public Subnet 1 to "Public Route Table"
# dev aws associate subnet with route table
resource "aws_route_table_association" "dev-private-subnet-1a-route-table-association" {
  subnet_id      = aws_subnet.dev-private-subnet-1a.id
  route_table_id = aws_route_table.dev-private-route.id
}
# Associate Public Subnet 2 to "Public Route Table"
# dev aws associate subnet with route table
resource "aws_route_table_association" "dev-private-subnet-1b-route-table-association" {
  subnet_id      = aws_subnet.dev-private-subnet-1b.id
  route_table_id = aws_route_table.dev-private-route.id
}
resource "aws_route_table_association" "dev-private-subnet-1c-route-table-association" {
  subnet_id      = aws_subnet.dev-private-subnet-1c.id
  route_table_id = aws_route_table.dev-private-route.id
}
resource "aws_route_table_association" "dev-data-subnet-1a-route-table-association" {
  subnet_id      = aws_subnet.dev-data-subnet-1a.id
  route_table_id = aws_route_table.dev-private-route.id
}  

resource "aws_route_table_association" "dev-data-subnet-1b-route-table-association" {
  subnet_id      = aws_subnet.dev-data-subnet-1b.id
  route_table_id = aws_route_table.dev-private-route.id
} 

resource "aws_route_table_association" "dev-data-subnet-1c-route-table-association" {
  subnet_id      = aws_subnet.dev-data-subnet-1c.id
  route_table_id = aws_route_table.dev-private-route.id
} 