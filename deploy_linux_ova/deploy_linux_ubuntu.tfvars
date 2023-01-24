#   Create Linux VM on VSphere IaC
#
#    


# Vault parameters

vault_url        = "https://vault.my.lan"
vault_token      = "hvs.vaulttoken"
adm_account_path = "vaultcredential/path"

# VSphere parameters

datacenter   = "mydatacenter"
vcenter_name = "vcenter.my.lan"
esxi_host    = "myesxihost.my.lan"
cluster_name = "Cluster"
network_name = "VM Network"
datastore    = "datastore"
ova_url      = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.ova"

# VM Parameters
number_machines = 3
last_number     = 1000
vmname          = "test-"
username        = "username"
sshpubkey       = "ssh-rsa AAAA"
cpus            = 2
memsize         = 4096
guestid         = "ubuntu64Guest"
disklabel1      = "OS_DISK"
disksize1       = 64
bios            = "efi"
hw_version      = "19"
ip4             = 100
ip6             = 100
net4            = "10.0.0."
net6            = "2001:beef:beef:beef::"
net4mask        = "/24"
net6mask        = "/64"
gw4             = "10.0.0.1"
gw6             = "fe80::beef:beef:beef:beef"
dns             = "8.8.8.8"
search_domain   = "my.lan"
comment         = "Terraform Deployment"