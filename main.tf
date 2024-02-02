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

module "backend" {
  source = "./modules/app"

  app_port            = var.backend_app_port
  bastion_cidrs       = var.bastion_cidrs
  component           = "backend"
  env                 = var.env
  instance_capacity   = var.backend_instance_capacity
  instance_type       = var.backend_instance_type
  project_name        = var.project_name
  sg_cidr_blocks      = var.app_subnets_cidr
  vpc_id              = module.vpc.vpc_id
  vpc_zone_identifier = module.vpc.app_subnets_ids
  parameters          = ["arn:aws:ssm:us-east-1:633854890313:parameter/${var.env}.${var.project_name}.rds.*"]
  kms                 = var.kms_key_id
}

module "frontend" {
  source = "./modules/app"

  app_port            = var.frontend_app_port
  bastion_cidrs       = var.bastion_cidrs
  component           = "frontend"
  env                 = var.env
  instance_capacity   = var.frontend_instance_capacity
  instance_type       = var.frontend_instance_type
  project_name        = var.project_name
  sg_cidr_blocks      = var.public_subnets_cidr
  vpc_id              = module.vpc.vpc_id
  vpc_zone_identifier = module.vpc.web_subnets_ids
  parameters          = []
  kms                 = var.kms_key_id
}

module "public-alb" {
  source = "./modules/alb"

  alb_name       = "public"
  internal       = false
  sg_cidr_blocks = ["0.0.0.0/0"]
  dns_name       = "frontend"

  project_name = var.project_name
  env          = var.env
  acm_arn      = var.acm_arn
  zone_id      = var.zone_id

  subnets          = module.vpc.public_subnets_ids
  vpc_id           = module.vpc.vpc_id
  target_group_arn = module.frontend.target_group_arn

}

module "private-alb" {
  source = "./modules/alb"

  alb_name = "private"
  internal = true
  dns_name = "backend"

  sg_cidr_blocks = var.web_subnets_cidr
  project_name   = var.project_name
  env            = var.env
  acm_arn        = var.acm_arn
  zone_id        = var.zone_id

  subnets          = module.vpc.app_subnets_ids
  vpc_id           = module.vpc.vpc_id
  target_group_arn = module.backend.target_group_arn

}
