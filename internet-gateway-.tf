
# --------------------------------
# Primary Internet Gateway
# --------------------------------
resource "aws_internet_gateway" "primary_igw" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id
  tags = {
    Name        = "Primary-IGW-${var.primary}"
    Environment = "Demo"
  }
}

# -----------------------------------
# Secondary Internet Gateway
# -----------------------------------
resource "aws_internet_gateway" "secondary_igw" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id
  tags = {
    Name        = "Secondary-IGW-${var.secondary}"
    Environment = "Demo"
  }
}