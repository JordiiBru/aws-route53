module "route53" {
  source = "../"

  # Required variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"
  domain_name = "mydomain.cloud"

  # Optional variables
  nameservers = [
    "ns1",
    "ns2",
    "ns3",
    "ns4"
  ]
}