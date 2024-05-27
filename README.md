# aws-route53

Terraform module to create Route 53 records in the jordibru.cloud hosted zone.

## Required Variables

| Name          | Description                                     | Type   | Validation                                    | Default |
|---------------|-------------------------------------------------|--------|-----------------------------------------------|---------|
| `stage`       | The stage of development (e.g., test, dev, staging, prod). | string | Must be one of `test`, `dev`, `staging`, `prod` | N/A     |
| `purpose`     | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`       | N/A     |
| `owner`       | The owner of the deployed infrastructure.       | string | Must have more than three characters          | N/A     |
| `domain_name` | The name of the domain.                         | string | Must have more than three characters          | N/A     |

## Optional Variables

| Name                       | Description                                           | Type   | Default              |
|----------------------------|-------------------------------------------------------|--------|----------------------|
| `cloudfront_endpoint`      | The CloudFront endpoint.                              | string | `""`                 |
| `cloudfront_zone_id`       | The CloudFront zone ID.                               | string | `""`                 |
| `domain_validation_options`| Domain validation objects used to complete certificate validation. | list(object({ validation })) | `[]` |

## Domain Validation Options

The `domain_validation_options` variable is a list of objects that define the parameters for domain validation. Each validation object contains the following parameters:

| Name                      | Description                                                    | Type   |
|---------------------------|----------------------------------------------------------------|--------|
| `domain_name`             | The name of the domain to validate.                            | string |
| `resource_record_name`    | The name of the resource record used for validation.           | string |
| `resource_record_type`    | The type of the resource record (e.g., CNAME, A).              | string |
| `resource_record_value`   | The value of the resource record used for validation.          | string |

## Outputs

| Name            | Description                                     |
|-----------------|-------------------------------------------------|
| `zone_name`     | The name of the default Route 53 hosted zone.   |
| `zone_id`       | The ID of the Route 53 hosted zone.             |
| `record_name`   | The name of the Route 53 A record.              |

## Usage

```hcl
module "route53" {
  source = "../"

  # Required variables
  stage                     = "dev"
  purpose                   = "tfg"
  owner                     = "wanda"
  domain_name               = "example.com"

  # Custom variables
  cloudfront_endpoint       = "XXX.cloudfront.net" # usually output from other modules
  cloudfront_zone_id        = "XXX" # usually output from other modules
  domain_validation_options = [
    {
      domain_name           = "example.com"
      resource_record_name  = "_abc123.example.com"
      resource_record_type  = "CNAME"
      resource_record_value = "example.com"
    }
  ]
}
```