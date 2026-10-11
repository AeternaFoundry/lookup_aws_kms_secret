output "kms_secret_lookup_id" {
  description = "Map of id values across all kms_secret_lookup, keyed the same as var.kms_secret_lookup"
  value       = { for k, v in data.aws_kms_secret.kms_secret_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kms_secret_lookup_region" {
  description = "Map of region values across all kms_secret_lookup, keyed the same as var.kms_secret_lookup"
  value       = { for k, v in data.aws_kms_secret.kms_secret_lookup : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kms_secret_lookup_secret" {
  description = "Map of secret values across all kms_secret_lookup, keyed the same as var.kms_secret_lookup"
  value       = { for k, v in data.aws_kms_secret.kms_secret_lookup : k => v.secret if v.secret != null && length(v.secret) > 0 }
}

