env                 = "dev"
project_name        = "expense"
vpc_cidr            = "10.10.0.0/18"
public_subnets_cidr = ["10.10.56.1/22", "10.10.56.254/22"]
web_subnets_cidr    = ["10.10.56.2/22", "10.10.56.254/22"]
app_subnets_cidr    = ["10.10.56.3/22", "10.10.56.254/22"]
db_subnets_cidr     = ["10.10.56.0/22", "10.10.56.254/22"]
az                  = ["us-east-1a", "us-east-1b"]

