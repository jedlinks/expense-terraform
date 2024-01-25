env           = "dev"
project_name  = "expense"
vpc_cidr = "10.10.0.0/18"
public_subnets_cidr = ["10.60.0.0/23", "10.10.60.254/23"]
web_subnets_cidr = ["10.10.61.0/23", "10.10.61.255/23"]
app_subnets_cidr = ["10.10.62.0/23", "10.10.62.255/23"]
db_subnets_cidr = ["10.10.63.0/23", "10.10.63.255/23"]
az = ["us-east-1a", "us-east-1b"]

