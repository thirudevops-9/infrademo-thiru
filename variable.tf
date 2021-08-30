variable "ssh-location" {
  default     = "0.0.0.0/0"
  description = "Ip address that can SSH into Bastion"
  type        = string
}




variable "vpc-cidr" {
  default = "10.1.0.0/16"
  type    = string
}
variable "dev-public-subnet-1a-cidr" {
  default = "10.1.0.0/24"
  type    = string
}
variable "dev-public-subnet-1b-cidr" {
  default = "10.1.1.0/24"
  type    = string
}
variable "dev-public-subnet-1c-cidr" {
  default = "10.1.2.0/24"
  type    = string
}
variable "dev-private-subnet-1a-cidr" {
  default = "10.1.3.0/24"
  type    = string
}
variable "dev-private-subnet-1b-cidr" {
  default = "10.1.4.0/24"
  type    = string
}
variable "dev-private-subnet-1c-cidr" {
  default = "10.1.5.0/24"
  type    = string
}

variable "dev-data-subnet-1a-cidr" {
  default = "10.1.6.0/24"
  type    = string
}
variable "dev-data-subnet-1b-cidr" {
  default = "10.1.7.0/24"
  type    = string
}
variable "dev-data-subnet-1c-cidr" {
  default = "10.1.8.0/24"
  type    = string
}
