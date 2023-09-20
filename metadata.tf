# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

data "jinja_template" "metadata" {
  for_each = local.hosts
  template = "./metadata.j2"
  context {
    type = "json"
    data = format(<<EOT
{
  "eth_prefix": "%s",
  "eth_start_num": %d,
  "host":  "%s",
  "nets": %v,
  "addresses\":%v
}
EOT
,
    local.eth_prefix,
    local.eth_start_num,
    each.key,
    keys(each.value),
    each.value)
  }
}
