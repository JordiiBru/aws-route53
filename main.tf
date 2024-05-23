# hosted zone
resource "aws_route53_zone" "hosted_zone" {
  name = var.domain_name

  tags = {
    terraform = true
    stage     = var.stage
    owner     = var.owner
  }
}

# A record
resource "aws_route53_record" "A_record" {
  #count   = (var.cloudfront_endpoint != "") && (var.cloudfront_zone_id != "") ? 1 : 0
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_endpoint
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

# NS record
resource "aws_route53_record" "NS_record" {
  #count           = length(var.nameservers) > 0 ? 1 : 0
  zone_id         = aws_route53_zone.hosted_zone.zone_id
  name            = var.domain_name
  type            = "NS"
  ttl             = 300
  allow_overwrite = true

  records = var.nameservers

  depends_on = [ aws_route53_record.A_record ]
}


# record validation
resource "aws_route53_record" "cert_validations" {
  for_each =  {
    for dvo in var.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.hosted_zone.zone_id

   depends_on = [ aws_route53_record.A_record ]
}