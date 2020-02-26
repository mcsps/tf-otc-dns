tf-otc-dns
==========

reference: https://www.terraform.io/docs/providers/opentelekomcloud/r/dns_recordset_v2.html


Configuration file: terraform.tfvars.json
-----------------------------------------

Zone entries are required for each zone and sub-zone

````

    "dnszones": {
      "<domain_name>": {
        "vpc_id": null, # only in private zones or null
        "region": null, # only in private zones or null
        "zone_description": "<description of the zones>",
        "zone_type": "<type>", # public or private
        "zone_ttl": <ttl_in_sec>, # zone ttl in seconds, i.e. 300 or 86500
        "zone_email": "<contact_email@adress>" # admin email contact


````

Zone records are in list form for all configured domains

````
  "dnsrecords":  [
    "<fqdn>;<description>;<record_type>;<ttl>;<record_data>",

````


