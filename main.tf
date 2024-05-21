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
}