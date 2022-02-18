output "cluster_id" {
  value      = data.rancher2_cluster.kube_cluster.id
}

output "cluster_default_project_id" {
  value      = data.rancher2_cluster.kube_cluster.default_project_id
}

output "cluster_kubeconfig" {
  value      = base64encode(data.rancher2_cluster.kube_cluster.kube_config)
  sensitive  = true
}
