module "servers" {
  source  = "./servers"
  servers = 1 #a variable value being assigned.
  environment = "staging1"
  blocks = var.blocks 
}

output "ip_address" {
  value = module.servers.ip_address
}

/* output "volume" {
  value = module.servers.volume_id
} */
