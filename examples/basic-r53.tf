module "route53" {
  source = "../"

  # Required variables
  stage       = "dev"
  purpose     = "tfg"
  owner       = "wanda"
  domain_name = "example.com"

  # Optional variables
  cloudfront_endpoint = "XXX.cloudfront.net" # usually output from other modules
  cloudfront_zone_id  = "XXX"                # usually output from other modules
  nameservers = [
    "ns-XXX.awsdns-XX.net", "ns-XXX.awsdns-XX.org"
  ]
}