# -----------------------------
# Primary Route Table
# -----------------------------
resource "aws_route_table" "primary_rt" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary_igw.id
  }

  tags = {
    Name        = "Primary-RT-${var.primary}"
    Environment = "Demo"
  }
}
resource "aws_route_table_association" "primary_rta" {
  provider       = aws.primary
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_rt.id
}

# -----------------------------
# Secondary Route Table
# -----------------------------
resource "aws_route_table" "secondary_rt" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_igw.id
  }

  tags = {
    Name        = "Secondary-RT-${var.secondary}"
    Environment = "Demo"
  }
}
resource "aws_route_table_association" "secondary_rta" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_rt.id
}