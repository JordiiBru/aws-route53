# COMMON VARIABLES

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

variable "subdomain" {
  description = "The name of the domain."
  type        = string

  validation {
    condition     = length(var.subdomain) >= 3
    error_message = "You must define a subdomain name with at least three characters."
  }
}

variable "type" {
  description = "The record type."
  type        = string

  validation {
    condition     = can(regex("^(A|AAAA|CAA|CNAME|MX|NAPTR|NS|PTR|SOA|SPF|SRV|TXT)$", var.type))
    error_message = "The record type must be one of the following: A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV, TXT."
  }
}

variable "records" {
  description = "A string list of records."
  type        = list(string)
  default     = []
}

variable "alias" {
  description = "Alias record object."
  type = object({
    name    = optional(string)
    zone_id = optional(string)
  })
  default = null
}