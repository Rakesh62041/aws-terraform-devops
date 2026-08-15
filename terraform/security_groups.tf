# Security Group for the Application Load Balancer
resource "aws_security_group" "alb" {

  # Name shown in AWS Console
  name = "aws-terraform-devops-alb-sg"

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

  # Allow outbound traffic
  egress {
    description = "Allow all outbound traffic"

    protocol = "-1"

    from_port = 0
    to_port   = 0

    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for identification
  tags = {
    Name = "aws-terraform-devops-alb-sg"
  }
}
