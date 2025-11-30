variable "instance_config" {
    type = object({
      ami_id = string,
      instance_type = string,
      instance_count = number,
      ssh_key_name = string
    })
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}
