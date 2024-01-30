env                 = "dev"
project_name        = "expense"
kms_key_id          = "arn:aws:kms:us-east-1:633854890313:key/a2c0e3e4-e10c-41db-bc09-21c79c747da6"
bastion_cidrs       = ["172.31.38.128/32"]
acm_arn             = "arn:aws:acm:us-east-1:633854890313:certificate/0577b271-256f-4da3-8293-fc30b5f4ed18"
zone_id             = "Z05050322P8QFCN8M8LU9"


vpc_cidr            = "10.80.0.0/22"
public_subnets_cidr = ["10.80.0.0/25", "10.80.0.128/25"]
web_subnets_cidr    = ["10.80.1.0/25", "10.80.1.128/25"]
app_subnets_cidr    = ["10.80.2.0/25", "10.80.2.128/25"]
db_subnets_cidr     = ["10.80.3.0/25", "10.80.3.128/25"]
az                  = ["us-east-1a", "us-east-1b"]

rds_allocated_storage = 10
rds_dbname            = "expense"
rds_engine            = "mysql"
rds_engine_version    = "5.7"
rds_instance_class    = "db.t3.micro"
rds_family            = "mysql5.7"

backend_app_port          = 8080
backend_instance_capacity = 1
backend_instance_type     = "t3.small"

frontend_app_port          = 80
frontend_instance_capacity = 1
frontend_instance_type     = "t3.small"