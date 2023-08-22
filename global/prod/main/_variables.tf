variable "default_tags" {
  default = {
    costcenter = "demo"
    ManagedBy = "Terraform"
    environment = "prod"
    TFRepoDirectory = "global/prod/main"
  }
  type = map(string)
}
