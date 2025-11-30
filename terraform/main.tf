module "ec2" {
  source      = "./modules/ec2"
  instance_config = {
    ami_id                 = var.instance_config.ami_id
    instance_type          = var.instance_config.instance_type
    instance_count         = var.instance_config.instance_count
    ssh_key_name           = var.instance_config.ssh_key_name
  }
}