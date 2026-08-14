output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.project_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.project_bucket.arn
}
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}
output "availability_zones" {
  description = "Available Availability Zones"
  value       = data.aws_availability_zones.available.names
}
output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of public subnets"
  value = [
    aws_subnet.public_1.cidr_block,
    aws_subnet.public_2.cidr_block
  ]
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of private subnets"
  value = [
    aws_subnet.private_1.cidr_block,
    aws_subnet.private_2.cidr_block
  ]
}
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}
