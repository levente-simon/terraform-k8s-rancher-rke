output "cluster_id" {
  value     = rancher2_cluster.kube_cluster.id
}

output "cluster_default_project_id" {
  value     = rancher2_cluster.kube_cluster.default_project_id
}

output "cluster_kubeconfig" {
  value     = base64encode(rancher2_cluster.kube_cluster.kube_config)
  sensitive = true
}

output "cluster_url" {
  value     = yamldecode(rancher2_cluster.kube_cluster.kube_config).clusters.0.cluster.server
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = yamldecode(rancher2_cluster.kube_cluster.kube_config).clusters.0.cluster.certificate-authority-data
  sensitive = true
}

output "cluster_client_certificate" {
  value     = yamldecode(rancher2_cluster.kube_cluster.kube_config).users.0.user.client-certificate-data
  sensitive = true
}

output "cluster_client_key" {
  value     = yamldecode(rancher2_cluster.kube_cluster.kube_config).users.0.user.client-key-data
  sensitive = true
}
