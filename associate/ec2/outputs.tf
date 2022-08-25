output "public_ip" {
  value = aws_instance.web.public_ip
}

output "sg_id" {
  value = aws_security_group.sgec2.id
}

output "instance_state" {
  value = aws_instance.web.public_ip
}

output "volume_id" {
  value = aws_instance.web.ebs_block_device
}