data "aws_kms_secret" "kms_secret_lookup" {
  for_each = var.kms_secret_lookup

  region = each.value.region

  dynamic "secret" {
    for_each = each.value.secret
    content {
      context      = secret.value.context
      grant_tokens = secret.value.grant_tokens
      name         = secret.value.name
      payload      = secret.value.payload
    }
  }
}

