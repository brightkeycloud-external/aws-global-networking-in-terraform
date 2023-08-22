variable "default_tags" {
  default = {
    TFRepoDirectory = "global/prod/main/transit-gateway-peering"
  }
  type = map(string)
}
