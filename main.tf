resource "opentelekomcloud_dns_zone_v2" "zone" {
  for_each    = var.dnszones
  name        = format("%s.",each.key)
  email       = each.value.zone_email
  description = each.value.zone_description
  ttl         = each.value.zone_ttl
  type        = each.value.zone_type

  dynamic "router" {
    for_each = each.value.zone_type == "private" ? [each.value.zone_type] : []

    content {
      # router_id  = opentelekomcloud_vpc_v1.vpc[each.value.vpc_name].id
      router_id     = each.value.vpc_id
      router_region = each.value.region
    }
  }
}

# resource "opentelekomcloud_dns_recordset_v2" "zone_record" {
#   for_each    = { for v in var.dnsrecords : v => v }
#   zone_id     = opentelekomcloud_dns_zone_v2.zone[trimprefix(regex("[.][^;?#]*",each.key ),".")].id
#   name        = format("%s.",element(split(";",each.key), 0))
#   description = element(split(";",each.key), 1)
#   type        = element(split(";",each.key), 2)
#   ttl         = element(split(";",each.key), 3)
#   records     = [ element(split(";",each.key), 4)]
# }

resource "opentelekomcloud_dns_recordset_v2" "zone_record" {
  count       = length(var.dnsrecords)
  zone_id     = opentelekomcloud_dns_zone_v2.zone[trimprefix(regex("[.][^;?#]*",var.dnsrecords[count.index] ),".")].id
  name        = format("%s.",element(split(";",var.dnsrecords[count.index]), 0))
  description = element(split(";",var.dnsrecords[count.index]), 1)
  type        = element(split(";",var.dnsrecords[count.index]), 2)
  ttl         = element(split(";",var.dnsrecords[count.index]), 3)
  records     = [ element(split(";",var.dnsrecords[count.index]), 4)]
}
