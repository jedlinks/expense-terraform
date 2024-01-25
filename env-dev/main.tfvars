env           = "dev"
project_name  = "expense"
vpc = {
    main = {
      vpc_cidr = "10.10.0.0/23"
      subnets_cidr = ["10.10.60.0/23", "10.10.60.255/23"]
      az = ["us-east-1a", "us-east-1b"]
    }
}