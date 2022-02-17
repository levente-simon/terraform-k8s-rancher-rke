output "cluster_id" {
  depends_on = [ time_sleep.wait_30_sec ]
  value      = rancher2_cluster.kube_cluster.id
}

output "cluster_default_project_id" {
  depends_on = [ time_sleep.wait_30_sec ]
  value      = rancher2_cluster.kube_cluster.default_project_id
}

output "cluster_kubeconfig" {
  depends_on = [ time_sleep.wait_30_sec ]
  value      = base64encode(rancher2_cluster.kube_cluster.kube_config)
  sensitive  = true
}
