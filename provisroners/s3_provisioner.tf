
provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 

# 1️⃣ Create S3 bucket (Terraform-managed)
resource "aws_s3_bucket" "example1" {
  bucket = "my-demo-bucket-arpit-12345"

  tags = {
    Name = "DemoBucket"
    Env  = "Dev"
  }
   versioning {
    enabled = true
  }
  
  force_destroy = true
}

# 2️⃣ Upload file using provisioner
resource "null_resource" "upload_file" {

  provisioner "local-exec" {
    command = "aws s3 cp hello.txt s3://${aws_s3_bucket.example1.bucket}/aws/s3/hello.txt"
  }

  depends_on = [
    aws_s3_bucket.example1
  ]
}

