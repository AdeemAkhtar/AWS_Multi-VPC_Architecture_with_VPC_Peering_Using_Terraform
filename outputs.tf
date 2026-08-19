output "primary_vpc_id" { 
    value = aws_vpc.primary_vpc.id
} 
output "secondary_vpc_id" { 
    value = aws_vpc.secondary_vpc.id
} 
output "primary_ec2_private_ip" { 
    value = aws_instance.primary_instance.private_ip
} 
output "secondary_ec2_private_ip" { 
    value = aws_instance.secondary_instance.private_ip
} 
output "vpc_peering_id" { 
    value = aws_vpc_peering_connection.primary_to_secondary.id
}