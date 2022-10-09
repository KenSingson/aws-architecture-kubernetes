# EKS IODC ROOT CA Thumbprint
variable "eks_oidc_root_ca_thumbprint" {
  type = string
  description = "Thumbprint for Root CA for EKS OIDC, valid `til 2037"
  default = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}