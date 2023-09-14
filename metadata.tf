# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

data "jinja_template" "metadata" {
  template = "./metadata.j2"
  context {
    type = "json"
    data = format("{\"hosts\": %s}", jsonencode(local.hosts))
  }
}
