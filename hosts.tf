# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

locals {
    hosts = {
       "HostA" = { "VM Network" = { "ens35" = "10.0.0.1/8" },
                   "HoatAB"     = { "ens36" = "192.168.0.1/24" } }
       "HostB" = { "VM Network" = { "ens35" = "10.0.0.2/8" },
                   "HostAB"     = { "ens36" = "192.168.0.2/24" },
                   "HostBC"     = { "ens37" = "172.21.0.2/24" } }
       "HostC" = { "VM Network" = { "ens35" = "10.0.0.3/8" },
                   "HostBC"     = { "ens36" = "172.21.0.1/24" } }
       }

       private_network = [for nic in distinct(flatten([
           for host in values(local.hosts) : keys(host)
       ])) : nic if nic != "VM Network"]
}
