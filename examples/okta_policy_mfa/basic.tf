data okta_group all {
  name = "Everyone"
}

resource okta_policy_mfa test {
  name        = "testAcc_replace_with_uuid"
  status      = "ACTIVE"
  description = "Terraform Acceptance Test MFA Policy"

  google_otp = {
    enroll = "REQUIRED"
  }

  groups_included = ["${data.okta_group.all.id}"]
}
