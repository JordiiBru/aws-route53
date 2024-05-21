# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "zone_name" {
  value = aws_route53_zone.hosted_zone.name
}

output "cert_record" {
  value = aws_route53_record.A_record[*]
}