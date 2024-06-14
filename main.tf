data "aws_route53_zone" "jordibru_cloud" {
  name = "jordibru.cloud"
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.jordibru_cloud.zone_id
  name    = "${var.subdomain}.jordibru.cloud"
  type    = var.type
  records = length(var.records) > 0 ? var.records : null

  ttl = var.alias == null ? 300 : null

  dynamic "alias" {
    for_each = var.alias == null ? [] : ["enabled"] # This works as an if-statement
    content {
      name                   = var.alias.name
      zone_id                = var.alias.zone_id
      evaluate_target_health = false
    }
  }
}