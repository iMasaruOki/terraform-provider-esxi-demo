# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

resource "esxi_guest" "vm" {
	for_each = local.hosts
	clone_from_vm = "debian12"
	guest_name = "${each.key}"
	power = "on"
	disk_store = "datastore1"
	dynamic network_interfaces {
		for_each = keys(each.value)
		content {
			virtual_network = network_interfaces.key
		}
	}
	 guestinfo = {
		"userdata" = base64gzip("#cloud-config\n")
		"userdata.encoding" = "gzip+base64"
		"metadata" = base64gzip(data.jinja_template.metadata[each.key].result)
		"metadata.encoding" = "gzip+base64"
	}
}
