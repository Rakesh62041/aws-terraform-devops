# Security Group for the Application Load Balancer
resource "aws_security_group" "alb" {
  #checkov:skip=CKV_AWS_260:HTTP port 80 is intentionally exposed for current ALB project scope

  # Name shown in AWS Console
  name = "aws-terraform-devops-${var.environment}-alb-sg"

  # Description of this security group
  description = "Security group for Application Load Balancer"

  # Security group belongs to our VPC
  vpc_id = module.vpc.vpc_id

  # Allow HTTP traffic from the internet
  ingress {
    description = "Allow HTTP from internet"

    # HTTP protocol
    protocol = "tcp"

    # HTTP port
    from_port = 80
    to_port   = 80

    # Allow HTTP from anywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS traffic from the internet
  ingress {
    description = "Allow HTTPS from internet"

    # HTTPS protocol
    protocol = "tcp"

    # HTTPS port
    from_port = 443
    to_port   = 443

    # Allow HTTPS from anywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound HTTP
  egress {
    description = "Allow outbound HTTP"

    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound HTTPS
  egress {
    description = "Allow outbound HTTPS"

    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for identification
  tags = {
    Name = "aws-terraform-devops-${var.environment}-alb-sg"
  }
}
