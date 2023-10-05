# SPDX-FileCopyrightText: 2023 Masaru OKI
#
# SPDX-License-Identifier: Apache-2.0

check "networking" {
    assert {
       condition = !contains(local.netcount, 1)
       error_message = format("single connection network detected: %v",
           compact([for k,v in zipmap(local.private_network, local.netcount) : v == 1 ? k : ""]))
    }
}
