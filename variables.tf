# REQUIRED VARIABLES
variable "stage" {
  description = "Stage of development"
  type        = string

  validation {
    condition     = can(regex("^(test|dev|stagin|prod)$", var.stage))
    error_message = "Stage must be dev, staging or prod."
  }
}

variable "purpose" {
  description = "Short description about the created resource"
  type        = string
  default     = null

  validation {
    condition     = can(regex("^([a-zA-Z0-9-_]*)$", var.purpose))
    error_message = "Only the expression [a-zA-Z0-9-_]* is allowed."
  }
}

variable "owner" {
  description = "Owner of the deployed infrastructure"
  type        = string
  default     = null

  validation {
    condition     = length(var.owner) >= 3
    error_message = "You must define an owner with more than three letters."
  }
}

# CUSTOM VARIABLES
variable "domain_name" {
  description = "Name of the domain"
  type        = string
  default     = ""
  validation {
    condition     = length(var.domain_name) >= 3
    error_message = "You must define a domain name."
  }
}

variable "cloudfront_endpoint" {
  description = "Cloudfront endpoint"
  type        = string
  default     = ""
}

variable "cloudfront_zone_id" {
  description = "Cloudfront zone id"
  type        = string
  default     = ""
}

variable "domain_validation_options" {
  description = "Domain validation objects which can be used to complete certificate validation."
    type        = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
  default     = []
}