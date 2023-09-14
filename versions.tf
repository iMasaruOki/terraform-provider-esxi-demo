# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source  = "josenk/esxi"
      version = ">= 1.8.0"
    }
    jinja = {
      source  = "NikolaLohinski/jinja"
      version = ">= 1.17.0"
    }
  }
}
