provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/rpit_k/.aws/credentials"]
    
}

#Partitionkey = LockID
terraform {
    backend "s3" {
        bucket = "tfstateb61"
        key = "terraform.tfstate"
        dynamodb_table = "b61"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/rpit_k/.aws/credentials"]
    }
}

resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-068c0051b15cdb816"
    key_name = "keys"
   vpc_security_group_ids = [ "sg-03841647403758b69" ]
}
