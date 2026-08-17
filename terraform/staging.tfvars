bucket_name  = "rakesh-terraform-devops-project-2026-staging"
project_name = "aws-terraform-devops"

vpc_cidr = "10.0.0.0/16"

instance_count    = 1
enable_monitoring = true

availability_zones_list = [
  "us-east-1a",
  "us-east-1b"
]

allowed_ports = [80, 443, 8080]

common_tags = {
  Project     = "aws-terraform-devops"
  Environment = "staging"
  Owner       = "Rakesh"
}

environment_instance_types = {
  dev     = "t3.micro"
  staging = "t3.small"
  prod    = "t3.medium"
}

server_config = {
  name          = "app-server"
  instance_type = "t3.small"
  monitoring    = true
  disk_size     = 30
}

environment = "staging"

db_password = "ProjectDemoPassword123!"
