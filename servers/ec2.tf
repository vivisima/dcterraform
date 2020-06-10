// module var file
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["178520105998"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  #count         = var.environment == "production" ? 2 : 1
  ami           = data.aws_ami.ubuntu.id
  for_each      = toset(var.instance_type)
  instance_type = each.value
  
  vpc_security_group_ids = var.sg
  subnet_id     = "subnet-8579a18b"
  key_name      = "vcskey"

  //dynamic blocks
  dynamic "ebs_block_device" {
    for_each = var.blocks
    content {
      device_name   = ebs_block_device.value["device_name"]
      volume_size   = ebs_block_device.value["volume_size"]
      volume_type   = ebs_block_device.value["volume_type"]
    }
  }

  tags = {
    //Name = "HelloWorld ${var.name}"
    Name = "Hello, %{ if var.name == "vivisima" }${var.name}%{ else }no chars%{ endif}!" 
    Env  = var.environment
  }

  /* provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip[count.index]} > ip_address.txt"
  } */
}