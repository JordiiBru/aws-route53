# REQUIRED VARIABLES

variable "stage" {
  description = "The stage of development (e.g., test, dev, staging, prod)."
  type        = string

  validation {
    condition     = can(regex("^(test|dev|staging|prod)$", var.stage))
    error_message = "Stage must be one of the following: test, dev, staging, prod."
  }
}

variable "purpose" {
  description = "A short description about the purpose of the created resource."
  type        = string
  default     = null

  validation {
    condition     = can(regex("^([a-zA-Z0-9-_]*)$", var.purpose))
    error_message = "Only the characters [a-zA-Z0-9-_] are allowed."
  }
}

variable "owner" {
  description = "The owner of the deployed infrastructure."
  type        = string
  default     = null

  validation {
    condition     = length(var.owner) >= 3
    error_message = "The owner name must be at least three characters long."
  }
}

# CUSTOM VARIABLES

variable "domain_name" {
  description = "The name of the domain."
  type        = string
  default     = ""

  validation {
    condition     = length(var.domain_name) >= 3
    error_message = "You must define a domain name with at least three characters."
  }
}

variable "cloudfront_endpoint" {
  description = "The CloudFront endpoint."
  type        = string
  default     = ""
}

variable "cloudfront_zone_id" {
  description = "The CloudFront zone ID."
  type        = string
  default     = ""
}

variable "domain_validation_options" {
  description = "Domain validation objects used to complete certificate validation."
  type        = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
  default     = []
}
