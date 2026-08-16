terraform {
  backend "s3" {
    bucket       = "rakesh-terraform-devops-state-2026"
    key          = "project3/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
