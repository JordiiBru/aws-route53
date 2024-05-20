module "route53" {
  source = "../"

  # Required variables
  stage                     = "dev"
  purpose                   = "tfg"
  owner                     = "wanda"
  domain_name               = "example.com"

  # Optional variables
  cloudfront_endpoint       = "XXX.cloudfront.net" # usually output from other modules
  cloudfront_zone_id        = "XXX" # usually output from other modules
  domain_validation_options = [
    {
      domain_name           = "example.com"
      resource_record_name  = "_acme-challenge.example.com"
      resource_record_value = "validation-value"
      resource_record_type  = "CNAME"
    }
  ]
  nameservers               = ["ns-XXX.awsdns-XX.net", "ns-XXX.awsdns-XX.org"]
}