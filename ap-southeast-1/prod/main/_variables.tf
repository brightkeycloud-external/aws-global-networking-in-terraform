variable "default_tags" {
  default = {
    TFRepoDirectory = "ap-southeast-1/prod/main"
  }
  type = map(string)
}

variable "vpc_cidr" {
  default = "10.106.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.106.0.0/20", "10.106.16.0/20", "10.106.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.106.128.0/20", "10.106.144.0/20", "10.106.160.0/20"]
  type = list (string)
}

variable "primary_az" {
  default = "ap-southeast-1a"
}
