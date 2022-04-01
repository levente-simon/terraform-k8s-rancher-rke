## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_rancher2"></a> [rancher2](#requirement\_rancher2) | >= 1.22.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_rancher2"></a> [rancher2](#provider\_rancher2) | >= 1.22.2 |
| <a name="provider_rancher2.new"></a> [rancher2.new](#provider\_rancher2.new) | >= 1.22.2 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.provision_k8s](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [rancher2_app_v2.cert-manager](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/app_v2) | resource |
| [rancher2_app_v2.external_dns](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/app_v2) | resource |
| [rancher2_app_v2.longhorn](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/app_v2) | resource |
| [rancher2_app_v2.metallb](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/app_v2) | resource |
| [rancher2_catalog_v2.bitnami](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/catalog_v2) | resource |
| [rancher2_catalog_v2.jetstack](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/catalog_v2) | resource |
| [rancher2_catalog_v2.metallb](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/catalog_v2) | resource |
| [rancher2_cluster.kube_cluster](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/cluster) | resource |
| [rancher2_cluster_sync.sync](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/cluster_sync) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_30s](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [rancher2_cluster.kube_cluster](https://registry.terraform.io/providers/rancher/rancher2/latest/docs/data-sources/cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_hosts"></a> [cluster\_hosts](#input\_cluster\_hosts) | n/a | `map(any)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_dns_port"></a> [dns\_port](#input\_dns\_port) | n/a | `string` | n/a | yes |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | n/a | `string` | n/a | yes |
| <a name="input_metallb_address_pool"></a> [metallb\_address\_pool](#input\_metallb\_address\_pool) | n/a | `string` | n/a | yes |
| <a name="input_no_proxy"></a> [no\_proxy](#input\_no\_proxy) | n/a | `string` | n/a | yes |
| <a name="input_os_user"></a> [os\_user](#input\_os\_user) | n/a | `string` | n/a | yes |
| <a name="input_proxy"></a> [proxy](#input\_proxy) | n/a | `string` | n/a | yes |
| <a name="input_rancher_token"></a> [rancher\_token](#input\_rancher\_token) | n/a | `string` | n/a | yes |
| <a name="input_rancher_url"></a> [rancher\_url](#input\_rancher\_url) | n/a | `string` | n/a | yes |
| <a name="input_searchdomain"></a> [searchdomain](#input\_searchdomain) | n/a | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | n/a | `string` | n/a | yes |
| <a name="input_longhorn_data_path"></a> [longhorn\_data\_path](#input\_longhorn\_data\_path) | n/a | `string` | `"/data/longhorn"` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | n/a | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_default_project_id"></a> [cluster\_default\_project\_id](#output\_cluster\_default\_project\_id) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_kubeconfig"></a> [cluster\_kubeconfig](#output\_cluster\_kubeconfig) | n/a |
