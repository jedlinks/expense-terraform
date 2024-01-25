module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnets_cidr = var.public_subnets_cidr
  web_subnets_cidr    = var.web_subnets_cidr
  app_subnets_cidr    = var.app_subnets_cidr
  db_subnets_cidr     = var.db_subnets_cidr
  az                  = var.az

  env          = var.env
  project_name = var.project_name
}