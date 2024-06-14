module "route53_alias" {
  source = "../"

  # Common variables
  stage   = "dev"
  purpose = "tfg"
  owner   = "wanda"

  # Custom variables
  subdomain = "portfolio" //This will create record portfolio.jordibru.cloud
  type      = "A"

  alias = {
    name    = "d1b1z1v7x1q1q1.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
  }
}