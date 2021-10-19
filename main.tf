resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-pavan123"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

  # The configuration for the `remote` backend.
   terraform {
       backend "remote" {
#         # The name of your Terraform Cloud organization.
         organization = "Test_org_pavan"
#
#         # The name of the Terraform Cloud workspace to store Terraform state files in.
         workspaces {
           name = "example-workspace"
      }
       }
     }
#
#     # An example resource that does nothing.
     resource "null_resource" "example" {
       triggers = {
         value = "A example resource that does nothing!"
       }
     }
