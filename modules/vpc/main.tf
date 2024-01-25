resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    name = "${var.env}-${var.project_name}-vpc"
  }
}
resource "aws_vpc_peering_connection" "main" {
  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.default.id
  auto_accept = true

  tags = {
    name = "${var.env}-vpc-with-default-vpc"
  }
}

resource "aws_subnet" "main" {
  count      = length(var.subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var, subnets_cidr, count.index)

  tags = {
    name = "subnets-${count.index}"
  }
}