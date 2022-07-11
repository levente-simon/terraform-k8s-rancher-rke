terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = ">= 1.24.0"
    }
  }
}

provider "rancher2" {
  api_url    = var.rancher_url
  token_key  = var.rancher_token
  insecure   = true
}

provider "rancher2" {
  alias      = "new"
  api_url    = var.rancher_url
  token_key  = var.rancher_token
  insecure   = true
}

variable module_depends_on {
  type    = any
  default = []
}

resource "rancher2_cluster" "kube_cluster" {
  depends_on   = [ var.module_depends_on ]
  name         = var.cluster_name
  description  = "Kube cluster"

  rke_config {
    network {
      plugin = "canal"
    }
  }
  cluster_auth_endpoint {
    enabled = true
  }
#  agent_env_vars {
#    name  = "HTTPS_PROXY"
#    value = var.proxy
#  }
#  agent_env_vars {
#    name  = "NO_PROXY"
#    value = var.no_proxy
#  }
}

resource "null_resource" "provision_k8s" {
  depends_on = [ rancher2_cluster.kube_cluster ]

  for_each = var.cluster_hosts

  connection {
    type        = "ssh"
    user        = var.os_user
    host        = each.value.fqdn
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = [
      format("${rancher2_cluster.kube_cluster.cluster_registration_token.0.node_command} --%s; sleep 2", join(" --", each.value.roles))
    ]
  }
}

resource "rancher2_cluster_sync" "sync" {
  depends_on = [ null_resource.provision_k8s ]
  cluster_id = rancher2_cluster.kube_cluster.id
}

resource "time_sleep" "wait_30s" {
  depends_on      = [ rancher2_cluster_sync.sync ]
  create_duration = "30s"
}

data "rancher2_cluster" "kube_cluster" {
  depends_on = [ time_sleep.wait_30s ]

  provider   = rancher2.new
  name       = var.cluster_name
}
