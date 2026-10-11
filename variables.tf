variable "kms_secret_lookup" {
  description = <<EOT
Map of kms_secret_lookup, attributes below
Required:
    - secret (block):
        - context (optional)
        - grant_tokens (optional)
        - name (required)
        - payload (required)
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
    secret = list(object({
      context      = optional(map(string))
      grant_tokens = optional(list(string))
      name         = string
      payload      = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kms_secret_lookup : (
        length(v.secret) >= 1
      )
    ])
    error_message = "Each secret list must contain at least 1 items"
  }
}

