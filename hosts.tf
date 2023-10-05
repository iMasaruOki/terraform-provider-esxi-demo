# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

locals {
    hosts = {
       "HostA" = { "VM Network" = [ "10.0.0.1/8" ],
                   "HoatAB"     = [ "192.168.0.1/24" ] }
       "HostB" = { "VM Network" = [ "10.0.0.2/8" ],
                   "HostAB"     = [ "192.168.0.2/24" ],
                   "HostBC"     = [ "172.21.0.2/24" ] }
       "HostC" = { "VM Network" = [ "10.0.0.3/8" ],
                   "HostBC"     = [ "172.21.0.1/24" ] }
       }

       private_network = [for nic in distinct(flatten([
           for host in values(local.hosts) : keys(host)
       ])) : nic if nic != "VM Network"]

       netcount = [for nic in local.private_network :
           length(compact([
              for name in flatten([for host in values(local.hosts) : keys(host)]) :
                   name == nic ? nic : "" ]))]
}
