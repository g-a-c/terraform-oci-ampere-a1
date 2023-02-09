resource "oci_core_security_list" "ampere_security_list" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_virtual_network.ampere_vcn.id
  display_name   = "ampereSecurityList"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "3000"
      min = "3000"
    }
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "4000"
      min = "4000"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "80"
      min = "80"
    }
  }

  dynamic "ingress_security_rules" {
    for_each = var.custom_ingress_rules
    content {
      protocol = ingress_security_rules.protocol
      source = ingress_security_rules.source
      dynamic "tcp_options" {
        for_each = ingress_security_rules.value.tcp_options
        content {
          max = tcp_options.max
          min = tcp_options.min
        }
      }
      dynamic "udp_options" {
        for_each = ingress_security_rules.value.udp_options
        content {
          max = udp_options.max
          min = udp_options.min
        }
      }
      dynamic "icmp_options" {
        for_each = ingress_security_rules.value.icmp_options
        content {
          type = icmp_options.type
          code = icmp_options.code
        }
      }
    }
  }
}
