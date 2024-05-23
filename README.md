# aws-route53
Terraform module to create a route53 hosted zone with records on it.

## Required Variables

| Name          | Description                                     | Type   | Validation                                           | Default |
|---------------|-------------------------------------------------|--------|------------------------------------------------------|------------------|
| `stage`       | Stage of development                            | string | `test`, `dev`, `staging`, `prod`                     | N/A              |
| `purpose`     | Short description about the created resource    | string | Must match the regex `^[a-zA-Z0-9-_]*$`              | N/A              |
| `owner`       | Owner of the deployed infrastructure            | string | Must have more than three characters                 | N/A              |
| `domain_name` | Name of the domain                              | string | Must have more than three characters                 | N/A              |

## Optional Variables

| Name                       | Description                            | Tipo   | Default              |
|----------------------------|----------------------------------------|--------|----------------------|
| `cloudfront_endpoint`      | Value                                  | string | `""`                 |
| `cloudfront_zone_id`       | Value                                  | string | `""`                 |
| `nameservers`              | List of nameservers                    | list(string) | `[]`           |

## Usage

```hcl
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
  nameservers               = ["ns-XXX.awsdns-XX.net", "ns-XXX.awsdns-XX.org"]
}
```