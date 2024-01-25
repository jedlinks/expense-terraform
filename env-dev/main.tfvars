env                 = "dev"
project_name        = "expense"
vpc_cidr            = "10.80.0.0/22"
public_subnets_cidr = ["10.80.0.0/25", "10.80.0.128/25"]
web_subnets_cidr    = ["10.80.1.0/25", "10.80.1.128/25"]
app_subnets_cidr    = ["10.80.2.0/25", "10.80.2.128/25"]
db_subnets_cidr     = ["10.80.3.0/25", "10.80.3.128/25"]
az                  = ["us-east-1a", "us-east-1b"]

