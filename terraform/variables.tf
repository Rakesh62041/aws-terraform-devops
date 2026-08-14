variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "rakesh-terraform-devops-project-2026"
}
variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aws-terraform-devops"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
