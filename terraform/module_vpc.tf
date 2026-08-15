module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  name_prefix  = local.name_prefix
  common_tags  = local.common_tags
}
