resource "aws_lb_target_group" "app" {
  #checkov:skip=CKV_AWS_378:HTTP is intentional for ALB-to-private-EC2 communication

  name     = "aws-terraform-devops-${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
  }

  tags = {
    Name = "aws-terraform-devops-${var.environment}-target-group"
  }
}
