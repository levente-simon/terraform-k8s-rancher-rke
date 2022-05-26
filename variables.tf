variable "os_user"              { type = string   }
variable "rancher_url"          { type = string   }
variable "cluster_name"         { type = string   }
variable "cluster_hosts"        { type = map(any) }
variable "metallb_address_pool" { type = string   }
variable "dns_server"           { type = string }
variable "dns_port"             { type = string }
variable "searchdomain"         { type = string }

variable "proxy"                {
  type = string
  default = ""
}
variable "no_proxy"             {
  type = string
  default = ""
}
variable "rancher_token"        { 
  type      = string  
  sensitive = true
 }
variable "ssh_private_key"      {
  type      = string   
  sensitive = true
 }

 variable "longhorn_data_path" {
  type    = string
  default = "/data/longhorn"
}
