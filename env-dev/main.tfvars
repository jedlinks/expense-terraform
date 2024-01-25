env                 = "dev"
project_name        = "expense"
vpc_cidr            = "10.10.0.0/16"
public_subnets_cidr = ["10.10.0.0/20", "10.10.0.128/20"]
web_subnets_cidr    = ["10.10.1.0/20", "10.10.1.128/20"]
app_subnets_cidr    = ["10.10.2.0/20", "10.10.2.128/20"]
db_subnets_cidr     = ["10.10.3.0/20", "10.10.3.128/20"]
az                  = ["us-east-1a", "us-east-1b"]

