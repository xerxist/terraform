#   Create Linux VM on VSphere IaC
#
#    



# Read Secret form path in the Vault

data "vault_generic_secret" "user_id" {
  path = var.adm_account_path
}

# Retrieve Datacenter Name

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

# Retrieve Datastore Name

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Retrieve Cluster Name

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Retrieve Network Name

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Retrieve host id

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Format Netplan

data "template_file" "netplan" {
  count    = var.number_machines
  template = file("${path.module}/netplan.tfpl")
  vars = {
    ip4           = "${var.ip4 + count.index}",
    net4          = var.net4,
    net4mask      = var.net4mask,
    ip6           = "${var.ip6 + count.index}",
    net6          = var.net6,
    net6mask      = var.net6mask,
    gw4           = var.gw4,
    gw6           = var.gw6,
    dns           = var.dns,
    search_domain = var.search_domain,
  }
}

# Format Cloud init

data "template_file" "cloud-init" {
  count    = var.number_machines
  template = file("${path.module}/cloud-init.tfpl")
  vars = {
    username     = var.username,
    sshpubkey    = var.sshpubkey,
    netplanout64 = base64encode(data.template_file.netplan[count.index].rendered),
  }
}


# Create Virtual Machine

resource "vsphere_virtual_machine" "vm" {
  count                      = var.number_machines
  name                       = "${var.vmname}${count.index + 1 + var.last_number}"
  datacenter_id              = data.vsphere_datacenter.datacenter.id
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  host_system_id             = data.vsphere_host.host.id
  datastore_id               = data.vsphere_datastore.datastore.id
  num_cpus                   = var.cpus
  memory                     = var.memsize
  guest_id                   = var.guestid
  hardware_version           = var.hw_version
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  firmware                   = var.bios
  annotation                 = var.comment
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  ovf_deploy {
    remote_ovf_url    = var.ova_url
    disk_provisioning = "thin"
  }
  disk {
    label            = var.disklabel1
    size             = var.disksize1
    thin_provisioned = true
    unit_number      = 0
  }
  cdrom {
    client_device = true
  }
  vapp {
    properties = {
      hostname  = "${var.vmname}${count.index + 1 + var.last_number}"
      user-data = "${base64encode(data.template_file.cloud-init[count.index].rendered)}"
    }
  }
}