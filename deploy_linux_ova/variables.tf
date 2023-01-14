#   Create Linux VM on VSphere IaC
#
#    



# Vcenter Name

variable "vcenter_name" {
  description = "VCenter Name"
  type        = string
}

# Cluster Name

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

# Network name

variable "network_name" {
  description = "Network Name"
  type        = string
}

# VM Name

variable "vmname" {
  description = "VM Name"
  type        = string
}

# Datastore Name

variable "datastore" {
  description = "Datastore Name"
  type        = string
}

# Datacenter Name

variable "datacenter" {
  description = "Datacenter Name"
  type        = string
}

# Number of CPU's

variable "cpus" {
  description = "Number of CPU's"
  type        = number
}

# Memory Size

variable "memsize" {
  description = "Memory Size"
  type        = number
}

# VM Guest ID

variable "guestid" {
  description = "VM Guest ID"
  type        = string
}

# Disk Size1

variable "disksize1" {
  description = "Disk Size1"
  type        = number
}

# Disk Label1

variable "disklabel1" {
  description = "Disk Label1"
  type        = string
}

# Vault URL

variable "vault_url" {
  description = "Vault URL"
  type        = string
}

# Vault Token

variable "vault_token" {
  description = "Vault Token"
  type        = string
}

# Vault Account Path

variable "adm_account_path" {
  description = "Vault ADM Account Path"
  type        = string
}

# OVA URL

variable "ova_url" {
  description = "OVA URL"
  type        = string
}

# BIOS

variable "bios" {
  description = "BIOS or EFI"
  type        = string
}

# ESXI Host

variable "esxi_host" {
  description = "ESXI Host"
  type        = string
}

# Hardware version

variable "hw_version" {
  description = "Hardware version"
  type        = string
}

# Number of Machines

variable "number_machines" {
  description = "Number of Machines"
  type        = number
}

# Comment in VMWare 

variable "comment" {
  description = "comment"
  type        = string
}

# Count from

variable "last_number" {
  description = "Count from"
  type        = number
}

# IPv4

variable "ip4" {
  description = "IPv4"
  type        = number
}

# IPv4 Net

variable "net4" {
  description = "IPv4 Net"
  type        = string
}

# IPv4 Mask

variable "net4mask" {
  description = "IPv4 Mask"
  type        = string
}

# IPv6

variable "ip6" {
  description = "IPv6"
  type        = number
}

# IPv6 Net

variable "net6" {
  description = "IPv6 Net"
  type        = string
}

# IPv6 Mask

variable "net6mask" {
  description = "IPv6 Mask"
  type        = string
}

# Gateway IPv4

variable "gw4" {
  description = "gw4"
  type        = string
}

# Gateway IPv6

variable "gw6" {
  description = "gw6"
  type        = string
}

# DNS Server

variable "dns" {
  description = "dns"
  type        = string
}

# Search domain

variable "search_domain" {
  description = "search_domain"
  type        = string
}

# Username

variable "username" {
  description = "username"
  type        = string
}

# SSH Public Key

variable "sshpubkey" {
  description = "sshpubkey"
  type        = string
}

# Netplan Base64 Encoded

variable "netplanout64" {
  description = "netplanout64"
  type        = string
  default     = ""
}