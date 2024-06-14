module "route53_cname" {
  source = "../"

  # Common variables
  stage   = "dev"
  purpose = "tfg"
  owner   = "wanda"

  # Custom variables
  subdomain = "lala" //This will create record portfolio.jordibru.cloud
  type      = "CNAME"
  records   = ["jordibru.cloud"]
}