#   Create Linux VM on VSphere IaC
#
#    


terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">=2.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">=3.7.0"
    }
  }
}

# Vault provider parameters

provider "vault" {
  address = var.vault_url
  token   = var.vault_token
}

# VSphere provider parameters

provider "vsphere" {
  user           = data.vault_generic_secret.user_id.data["id"]
  password       = data.vault_generic_secret.user_id.data["pass"]
  vsphere_server = var.vcenter_name

  # If you have a self-signed cert
  allow_unverified_ssl = true
}