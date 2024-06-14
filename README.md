# aws-route53

Terraform module to create Route 53 records inside jordibru.cloud hosted zone.

## Common Variables

| Name      | Description                                                    | Type   | Validation                                      | Default | Required |
|-----------|----------------------------------------------------------------|--------|-------------------------------------------------|---------|----------|
| `stage`   | The stage of development (e.g., test, dev, staging, prod).     | string | Must be one of `test`, `dev`, `staging`, `prod` |         | yes      |
| `purpose` | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`         |         | yes      |
| `owner`   | The owner of the deployed infrastructure.                      | string | Must have more than three characters            |         | yes      |

## Custom Variables

Exactly one of records or alias must be specified: this determines whether it's an alias record.

| Name        | Description                                                        | Type          | Validation                                                         | Default | Required |
|-------------|--------------------------------------------------------------------|---------------|--------------------------------------------------------------------|---------|----------|
| `subdomain` | The subdomain prefixed to jordibru.cloud TLD.                      | string        | Must have more than three characters                               |         | yes      |
| `type`      | The record type.                                                   | string        | A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT |         | yes      |
| `records`   | A string list of records.                                          | list(string)  | `alias` must be null                                               | []      | no       |
| `alias`     | Domain validation objects used to complete certificate validation. | object(alias) | `records` must be null                                             | null    | no       |

## alias

| Name      | Description                                                                                                        | Type   | Validation | Default | Required |
|-----------|--------------------------------------------------------------------------------------------------------------------|--------|------------|---------|----------|
| `name`    | DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone. | string |            |         | yes      |
| `zone_id` | Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone                              | string |            |         | yes      |

## Outputs

| Name          | Description                                   |
|---------------|-----------------------------------------------|
| `zone_name`   | The name of the default Route 53 hosted zone. |
| `zone_id`     | The ID of the Route 53 hosted zone.           |
| `record_name` | The name of the Route 53 record.              |

## Usage

```hcl
module "route53" {
  source = "git@github.com:JordiiBru/aws-route53.git?ref=[TAG]"

  # Common variables
  stage                     = "dev"
  purpose                   = "tfg"
  owner                     = "wanda"
  
  # Custom variables
  subdomain = "portfolio" //This will create record portfolio.jordibru.cloud
  tpye      = "A"

  alias = {
    name    = "d1b1z1v7x1q1q1.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
  }
}
```