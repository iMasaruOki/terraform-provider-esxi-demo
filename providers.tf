# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

provider "esxi" {
    esxi_hostname = "Your_ESXi_Hostname_or_IPaddress"
    esxi_username = "Your_Account_for_ESXi"
    esxi_password = "Your_Password_for_ESXi"
}

provider "jinja" {}
