# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "zone_name" {
  description = "The name of the default Route 53 hosted zone."
  value       = data.aws_route53_zone.jordibru_cloud.name
}

output "zone_id" {
  description = "The ID of the Route 53 hosted zone."
  value       = data.aws_route53_zone.jordibru_cloud.zone_id
}

output "record_name" {
  description = "The name of the Route 53 record."
  value       = aws_route53_record.record.name
}