variable "dnszones" {
  type = map(object({
    vpc_id           = string
    region           = string
    zone_description = string
    zone_email       = string
    zone_type        = string
    zone_ttl         = number
  }))
}

variable "dnsrecords" {
  type = list
}


variable "region" {
  default = "eu-de"
}
variable "otc_domain" {
  default = "eu-de"
}

variable "auth_url" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "tenant_name" {
  default = "eu-de"
}

variable  "access_key" {}

variable  "secret_key" {}
