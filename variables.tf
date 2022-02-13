variable "os_user"              { type = string   }
variable "rancher_url"          { type = string   }
variable "cluster_name"         { type = string   }
variable "proxy"                { type = string   }
variable "no_proxy"             { type = string   }
variable "cluster_hosts"        { type = map(any) }
variable "metallb_address_pool" { type = string   }
variable "dns_server"           { type = string }
variable "dns_port"             { type = string }
variable "searchdomain"         { type = string }
variable "rancher_token"        { 
  type      = string  
  sensitive = true }
variable "ssh_private_key"      {
  type      = string   
  sensitive = true }
