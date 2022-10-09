# Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources will be created"
  type = string
  default = "ap-southeast-1"
}

# Environment 
variable "environment" {
  description = "Environment used as a prefix"
  type = string
  default = "dev"
}

# Business Division
variable "business_division" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
}