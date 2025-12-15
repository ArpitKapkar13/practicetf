provider "aws" {
  region = "us-east-1"
  profile = "configs"
}

resource "aws_instance" "example" {
   instance_type = "t2.micro"
   ami = var.ami_list[count.index]
   key_name = "keys" 
   vpc_security_group_ids =["sg-03841647403758b69"]
   count = length(var.ami_list)
}

variable "ami_list" {
  default = ["ami-068c0051b15cdb816" ,"ami-0c398cb65a93047f2"]
}




resource "aws_instance" "example" {
   instance_type = "t2.micro"
   ami = each.key
   for_each = toset(var.ami_list)
   key_name = "keys" 
   vpc_security_group_ids =["sg-03841647403758b69"]
   count = length(var.ami_list)
}

variable "ami_list" {
  default = ["ami-068c0051b15cdb816" ,"ami-0c398cb65a93047f2"]
}




























variable "servers" {
  description = "Server list with instance types"
  default = {
    web  = "t2.micro"
    app  = "t2.small"
    db   = "t2.medium"
  }
}

variable "ami_id" {
  default = ["ami-068c0051b15cdb816" ,"ami-0c398cb65a93047f2"]
}


resource "aws_instance" "myserver" {
  for_each = var.servers

  ami           = var.ami_id[count.index]
  instance_type = each.value
  count = length(var.ami_id)

  tags = {
    Name = each.key
  }
}

# ---------- OUTPUTS ----------
# Output: Instance AMI for each server
output "server_ami" {
  value = { for name, inst in aws_instance.myserver : name => inst.ami }
}

# Output: Instance ID for each server
output "server_ids" {
  value = { for name, inst in aws_instance.myserver : name => inst.id }
}

# Output: Instance Public IP for each server
output "server_public_ip" {
  value = { for name, inst in aws_instance.myserver : name => inst.public_ip }
}





































