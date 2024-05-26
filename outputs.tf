# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "zone_name" {
  value = data.aws_route53_zone.jordibru_cloud.name
}

output "zone_id" {
  value = data.aws_route53_zone.jordibru_cloud.zone_id
}

output "record_name" {
  value = aws_route53_record.A_record[0].name
}