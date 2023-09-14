# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

resource "esxi_vswitch" "vswitch" {
	 for_each = toset(local.private_network)
	 name = each.key
}

resource "esxi_portgroup" "portgroup" {
	 for_each = toset(local.private_network)
	 name = each.key
	 vswitch = each.key
}
