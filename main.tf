data "aws_route53_zone" "jordibru_cloud" {
  name         = "jordibru.cloud"
}

# A record
resource "aws_route53_record" "A_record" {
  count   = (var.cloudfront_endpoint != "") && (var.cloudfront_zone_id != "") ? 1 : 0
  zone_id = data.aws_route53_zone.jordibru_cloud.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_endpoint
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}