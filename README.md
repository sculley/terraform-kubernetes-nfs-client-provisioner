# terraform-nfs-client-provisioner
Terraform module which deploys nfs-client-provisioner to a Kubernetes cluster

## Description

This Terraform module deploys the helm chart [nfs-client-provisioner](https://github.com/helm/charts/tree/master/stable/nfs-client-provisioner) which is an automatic storage provisioner for Kubernetes that uses your existing already configured NFS server, automatically creating Persistant Volumes.

The application project is called [nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner) which is a Kubernetets Sigs project.

## Requirements

- Terraform 0.13+
- Kubernetes Cluster 

## How to use

The module makes use of the [Helm Provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs) which looks for Kubernetes configuration in the following location ```"~/.kube/config"```

### Create a Terraform Configuration
---

Create a new directory

```shell
$ mkdir example-deployment
```

Change into the directory

```shell
$ cd example-deployment
```

Create a file for the configuration code

```shell
$ touch main.tf
```

Paste the following configuration into ```main.tf``` and save it. Make sure you update the nfs_server/nfs_server_path values to match your NFS server. You can change some of the other values defined in variables.tf too.

```
module "nfs-client-provisioner" {
  source = "github.com/sculley/terraform-nfs-client-provisioner"

  namespace        = "nfs-client-provisioner"
  create_namespace = true
  replica_count    = 2
  nfs_server       = "192.168.122.1"
  nfs_server_path  = "/mnt/nfs_shares/kubernetes"
}
```

Run terraform init

```shell
$ terraform init
```

Run terraform plan

```
$ terraform plan
```

Apply the Terraform configuration

```shell
$ terraform apply
```