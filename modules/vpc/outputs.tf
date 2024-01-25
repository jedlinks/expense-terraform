output "vpc_id" {
  value = "aws_vpc.main.id"
}

output "public_subnets_ids" {
  value = "aws_subnets.public.*.id"
}

output "web_subnets_ids" {
  value = "aws_subnets.web.*.id"
}

output "app_subnets_ids" {
  value = "aws_subnets.app.*.id"
}

output "db_subnets_ids" {
  value = "aws_subnets.db.*.id"
}