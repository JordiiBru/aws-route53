# aws-route53
Terraform module to create a route53 hosted zone with optional configurations.

## Required Variables

| Nombre        | Descripción                                     | Tipo   | Valores Permitidos                                    | Valor Predeterminado |
|---------------|-------------------------------------------------|--------|------------------------------------------------------|----------------------|
| `stage`       | Stage of development                            | string | `test`, `dev`, `staging`, `prod`                     | Ninguno              |
| `purpose`     | Short description about the created resource    | string | Expresión regular: `^[a-zA-Z0-9-_]*$`                | Ninguno              |
| `owner`       | Owner of the deployed infrastructure            | string | Mínimo 3 caracteres                                  | Ninguno              |
| `domain_name` | Name of the domain                              | string | Mínimo 3 caracteres                                  | Ninguno              |

## Optional Variables

| Nombre                     | Descripción                            | Tipo   | Valor Predeterminado |
|----------------------------|----------------------------------------|--------|----------------------|
| `cloudfront_endpoint`      | Value                                  | string | `""`                 |
| `cloudfront_zone_id`       | Value                                  | string | `""`                 |
| `domain_validation_options`| List of domain validation options      | list(object) | `[]`                 |
| `nameservers`              | List of nameservers                    | list(string) | `[]`                 |

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
```