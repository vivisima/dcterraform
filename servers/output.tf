output "ip_address" {
  #value = "${aws_instance.web[*].public_ip}"
  value = {
    for instance in aws_instance.web:
    instance.id => instance.private_ip
  }
}

/* output "volume_id" {
    value = {
    for volume in ebs_block_device[]:
    volume.id => volume.volume_id
  }
} */
