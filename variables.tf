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

variable "domain_name" {
  description = "Name of the domain"
  type        = string
  default     = null
  validation {
    condition     = length(var.domain_name) >= 3
    error_message = "You must define a domain name."
  }
}

# OPTIONAL VARIABLES
variable "cloudfront_endpoint" {
  description = "value"
  type        = string
  default     = ""
}

variable "cloudfront_zone_id" {
  description = "value"
  type        = string
  default     = ""
}

variable "domain_validation_options" {
  description = "List of domain validation options"
  type = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_value = string
    resource_record_type  = string
  }))
  default = []
}

variable "nameservers" {
  description = "List of nameservers"
  type        = list(string)
  default     = []
}