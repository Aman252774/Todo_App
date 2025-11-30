resource "aws_instance" "backend" {
    ami = var.instance_config.ami_id
    instance_type = var.instance_config.instance_type
    count = var.instance_config.instance_count
    key_name = var.instance_config.ssh_key_name
}

# resource "aws_security_group" "ssh" {
#   name = "ssh-sg"
#   description = "Security group for SSH access"

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "ssh-sg"
#   }
# }

# resource "aws_security_group" "backend" {
#   name = "${var.environment}-backend-sg"
#   description = "Security group for backend instances"
#   vpc_id = var.instance_config.vpc_id

#   ingress {
#     from_port = 3000
#     to_port = 3002
#     protocol = "tcp"
#     security_groups = [var.instance_config.alb_security_group_id]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_lb_target_group_attachment" "backend" {
#   count = var.instance_config.instance_count
#   target_group_arn =  var.instance_config.target_group_arn
#   target_id = aws_instance.backend[count.index].id
#   port = 3002

#   lifecycle {
#     create_before_destroy = true
#   }
# }