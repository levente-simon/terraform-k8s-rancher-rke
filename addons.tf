resource "time_sleep" "wait_30_seconds" {
  depends_on = [ rancher2_cluster_sync.sync ]
  create_duration = "30s"
}

################################################################
##
##       Catalogs
##
################################################################

resource "rancher2_catalog_v2" "bitnami" {
  depends_on = [ time_sleep.wait_30_seconds ]
  cluster_id = rancher2_cluster.kube_cluster.id
  name       = "bitnami"
  url        = "https://charts.bitnami.com/bitnami"
}

resource "rancher2_catalog_v2" "metallb" {
  depends_on = [ time_sleep.wait_30_seconds ]
  cluster_id = rancher2_cluster.kube_cluster.id
  name       = "metallb"
  url        = "https://metallb.github.io/metallb"
}

################################################################
##
##       Longhorn
##
################################################################

resource "rancher2_app_v2" "longhorn" {
  depends_on = [ time_sleep.wait_30_seconds ]

  cluster_id = rancher2_cluster.kube_cluster.id
  name       = "longhorn"
  repo_name  = "rancher-charts"
  chart_name = "longhorn"
  namespace  = "longhorn-system"
}

################################################################
##
##       metallb
##
################################################################

resource "rancher2_app_v2" "metallb" {
  depends_on = [ rancher2_catalog_v2.metallb,
                 time_sleep.wait_30_seconds ]

  cluster_id = rancher2_cluster.kube_cluster.id
  name       = "metallb"
  repo_name  = "metallb"
  chart_name = "metallb"
  namespace  = "metallb"
  values     = format(file("${path.module}/etc/metallb-config.yaml"), var.metallb_address_pool)
}

################################################################
##
##       ExternalDNS
##
################################################################

resource "rancher2_app_v2" "external_dns" {
  depends_on = [ rancher2_catalog_v2.bitnami,
                 time_sleep.wait_30_seconds ]
  cluster_id = rancher2_cluster.kube_cluster.id

  name       = "external-dns"
  repo_name  = "bitnami"
  chart_name = "external-dns"
  namespace  = "external-dns"
  values     = format(file("${path.module}/etc/external-dns-config.yaml"), var.dns_server, var.dns_port, var.searchdomain)
}
