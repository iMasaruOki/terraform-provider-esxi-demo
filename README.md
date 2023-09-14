# DEMO: Deploy multiple VMs and Networks on VMware ESXi

## Abstract

Deploy VMs, vswitches, and portgroups using `terraform-provider-esxi`.

## Prerequisites

- Base VM image
- VMware ESXi server
- Terraform
- ovftool

## Execution

```
terraform init
terraform validate
terraform plan
terraform apply
```

## Customization

TODO: Integrated variables HCL file

- hosts.tf
  - VMs
  - Networks (vswitches and portgroups)
  - NICs and assigned IP addrress

- providers.tf
  - ESXi hostname, username and password

- vm.tf
  - base VM name for clone

## Description

See [Blog post on Qiita (In Japanese)](https://qiita.com/masru0714/items/f95a99d07c7f4bc6ef40)

## License

Apache-2.0
