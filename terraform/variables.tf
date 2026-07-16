variable "aws_region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "email_address" {
  description = "Email for SNS alerts"
}

variable "project_name" {
  default = "aws-monitoring"
}