# ----------------------------------
# EC2 instance in Primary VPC
# ----------------------------------
resource "aws_instance" "primary_instance" {
  provider               = aws.primary
  ami                    = data.aws_ami.primary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.primary_subnet.id
  vpc_security_group_ids = [aws_security_group.primary_sg.id]
  key_name               = var.primary_key_name

  associate_public_ip_address = true

  user_data = local.primary_user_data

  tags = {
    Name        = "Primary-VPC-Instance"
    Environment = "Demo"
    Region      = var.primary
  }
  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

# ------------------------------------
# EC2 instance in Secondary VPC
# ------------------------------------
resource "aws_instance" "secondary_instance" {
  provider               = aws.secondary
  ami                    = data.aws_ami.secondary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.secondary_subnet.id
  vpc_security_group_ids = [aws_security_group.secondary_sg.id]
  key_name               = var.secondary_key_name

  associate_public_ip_address = true
  user_data                   = local.secondary_user_data

  tags = {
    Name        = "Secondary-VPC-Instance"
    Environment = "Demo"
    Region      = var.secondary
  }
  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}