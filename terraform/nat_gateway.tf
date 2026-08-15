# ============================================================
# ELASTIC IP FOR NAT GATEWAY
# ============================================================

resource "aws_eip" "nat" {

  # Elastic IP ko VPC context mein allocate kar rahe hain.
  #
  # Is public/static IP ko baad mein NAT Gateway ke saath
  # associate karenge.
  domain = "vpc"

  # Resource ko easily identify karne ke liye AWS tag.
  tags = {
    Name = "${var.project_name}-nat-eip"
  }
}
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = module.vpc.public_subnet_ids[0]

  tags = {
    Name = "aws-terraform-devops-nat-gateway"
  }

  depends_on = [module.vpc]
}
