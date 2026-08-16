# ============================================================
# APPLICATION LOAD BALANCER
# ============================================================

resource "aws_lb" "app" {
  # "application" means we are creating an Application
  # Load Balancer instead of Network Load Balancer.
  name = "aws-terraform-devops-${var.environment}-alb"

  # ALB internet se traffic receive karega.
  # Therefore it must be internet-facing.
  internal = false

  # ALB ka type Application Load Balancer hai.
  load_balancer_type = "application"

  # ALB ko hamare existing ALB Security Group se protect karenge.
  security_groups = [aws_security_group.alb.id]

  # ALB ko 2 public subnets mein place kar rahe hain.
  # Isse ALB multiple Availability Zones mein available rahega.
  subnets = module.vpc.public_subnet_ids

  # AWS Console mein ALB ko easily identify karne ke liye tags.
  tags = {
    Name = "aws-terraform-devops-${var.environment}-alb"
  }
}
