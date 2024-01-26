variable "env" {}
variable "kms_key_id" {}
variable "bastion_cidrs" {}

variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnets_cidr" {}
variable "web_subnets_cidr" {}
variable "app_subnets_cidr" {}
variable "db_subnets_cidr" {}
variable "az" {}

variable "allocated_storage" {}
variable "dbname" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "family" {}

variable "backend_app_port" {}
variable "backend_instance_capacity" {}
variable "backend_instance_type" {}

variable "frontend_app_port" {}
variable "frontend_instance_capacity" {}
variable "frontend_instance_type" {}

variable "acm_arn" {}
variable "zone_id" {}