variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "instance_count" {
  description = "Number of application instances"
  type        = number
}

variable "enable_monitoring" {
  description = "Enable monitoring"
  type        = bool
}

variable "availability_zones_list" {
  description = "Availability zones"
  type        = list(string)
}

variable "allowed_ports" {
  description = "Allowed application ports"
  type        = set(number)
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}

variable "environment_instance_types" {
  description = "Instance types for different environments"
  type        = map(string)
}

variable "server_config" {
  description = "Application server configuration"

  type = object({
    name          = string
    instance_type = string
    monitoring    = bool
    disk_size     = number
  })
}
variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition = contains(
      ["dev", "staging", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, staging, or prod."
  }
}
