variable "default_tags" {
  default = {
    TFRepoDirectory = "global/prod/main/vpc-peering"
  }
  type = map(string)
}
