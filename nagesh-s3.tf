# # 
# }



# terraform {
#   backend "s3" {
#     bucket = "nagesh-terra"
#     key    = "myapp/1vpc/terraform.tfstate"
#     region = "us-east-2"
#     dynamodb_table = "nagesh-terra"
#   }
# terraform {
#   backend "s3" {
#     bucket = "testate"
#     key    = "myapp/1vpc/terraform.tfstate"
#     region = "ap-south-1"
#     dynamodb_table = "terraformstatelock"
#   }
# }