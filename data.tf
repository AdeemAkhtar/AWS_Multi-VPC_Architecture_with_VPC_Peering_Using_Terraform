# Data Source to get availabile AZ's in primary region
data "aws_availability_zones" "primary" {
  provider = aws.primary
  state    = "available"
}

# Data Source to get availabile AZ's in Secondary Region
data "aws_availability_zones" "secondary" {
  provider = aws.secondary
  state    = "available"
}


#AMI for primary
data "aws_ami" "primary_ami" {
  provider    = aws.primary
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#AMI Secondary
data "aws_ami" "secondary_ami" {
  provider    = aws.secondary
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}