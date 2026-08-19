resource "aws_lb" "app" {
  #checkov:skip=CKV_AWS_91:ALB access logging not required in current project
  #checkov:skip=CKV_AWS_150:Deletion protection disabled to allow Terraform destroy
  #checkov:skip=CKV2_AWS_20:HTTPS redirect requires ACM certificate and domain
  #checkov:skip=CKV2_AWS_28:WAF not included in current project scope

  name               = "aws-terraform-devops-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"

  drop_invalid_header_fields = true

  security_groups = [aws_security_group.alb.id]
  subnets         = module.vpc.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "aws-terraform-devops-${var.environment}-alb"
  }
}
