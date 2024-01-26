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

module "rds" {
  source = "./modules/rds"

  allocated_storage = var.rds_allocated_storage
  dbname            = var.rds_dbname
  engine            = var.rds_engine
  engine_version    = var.rds_engine_version
  family            = var.rds_family
  instance_class    = var.rds_instance_class

  env          = var.env
  project_name = var.project_name
  kms_key_id   = var.kms_key_id

  subnet_ids     = module.vpc.app_subnets_ids
  vpc_id         = module.vpc.vpc_id
  sg_cidr_blocks = var.app_subnets_cidr
}

