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

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "443"
      min = "443"
    }
  }

  ingress_security_rules {
    protocol = "17"
    source   = "0.0.0.0/0"

    udp_options {
      max = "60050"
      min = "60000"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22000"
      min = "22000"
    }
  }

  ingress_security_rules {
    protocol = "17"
    source   = "0.0.0.0/0"

    udp_options {
      max = "22000"
      min = "22000"
    }
  }

  ingress_security_rules {
    protocol = "17"
    source   = "0.0.0.0/0"

    udp_options {
      max = "21027"
      min = "21027"
    }
  }

  ingress_security_rules {
    protocol = "17"
    source   = "0.0.0.0/0"

    udp_options {
      max = "51820"
      min = "51820"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22067"
      min = "22067"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22070"
      min = "22070"
    }
  }

  # dynamic "ingress_security_rules" {
  #   for_each = {for rule in var.custom_ingress_rules: rule.description => rule }
  #   content {
  #     protocol = ingress_security_rules.value.protocol
  #     source = ingress_security_rules.value.source
  #     dynamic "tcp_options" {
  #       for_each = [ingress_security_rules.value.tcp_options]
  #       content {
  #         max = tcp_options.value.max
  #         min = tcp_options.value.min
  #       }
  #     }
  #     dynamic "udp_options" {
  #       for_each = [ingress_security_rules.value.udp_options]
  #       content {
  #         max = udp_options.value.max
  #         min = udp_options.value.min
  #       }
  #     }
  #     dynamic "icmp_options" {
  #       for_each = [ingress_security_rules.value.icmp_options]
  #       content {
  #         type = icmp_options.value.type
  #         code = icmp_options.value.code
  #       }
  #     }
  #   }
  # }
}
