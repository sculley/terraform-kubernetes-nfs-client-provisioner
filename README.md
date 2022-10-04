# terraform-nfs-client-provisioner
This Terraform module deploys the helm chart [nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner) that used to be known as [nfs-client-provisioner](https://github.com/kubernetes-retired/external-storage/tree/master/nfs-client).

NFS subdir external provisioner is an automatic provisioner that use your existing and already configured NFS server to support dynamic provisioning of Kubernetes Persistent Volumes via Persistent Volume Claims. Persistent volumes are provisioned as ${namespace}-${pvcName}-${pvName}.

## Usage

The module makes use of the [Helm Provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs) which looks for Kubernetes configuration in the following location ```"~/.kube/config"```

- Create a new directory

  ```shell
  mkdir example-deployment
  ```

- Change into the directory

  ```shell
  cd example-deployment
  ```

- Create a file for the configuration code

  ```shell
  touch main.tf
  ```

- Paste the following configuration into ```main.tf``` and save it. Make sure you update the nfs_server/nfs_server_path values to match your NFS server. You can change some of the other values defined in variables.tf too.

  ```hcl
  module "nfs-client-provisioner" {
    source = "github.com/sculley/terraform-nfs-client-provisioner"

    create_namespace = true
    nfs_server       = "192.168.122.1"
    nfs_server_path  = "/mnt/nfs_shares/kubernetes"
  }
  ```

- Run terraform init

  ```shell
  terraform init
  ```

- Run terraform plan

  ```
  terraform plan
  ```

- Apply the Terraform configuration

  ```shell
  terraform apply
  ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.nfs_client_provisioner](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | (Optional) Create namespace, defaults to `false` | `bool` | `false` | no |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | (Optional) Chart name to be installed (Name of the chart to source/install), defaults to `nfs-subdir-external-provisioner` | `string` | `"nfs-subdir-external-provisioner"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | (Optional) Chart version to be installed (Version of the chart to source/install, defaults to `4.0.17`) | `string` | `"4.0.17"` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | (Optional) Release name (Name used when creating the helm chart), defaults to `nfs-client-provisioner` | `string` | `"nfs-client-provisioner"` | no |
| <a name="input_helm_repository_url"></a> [helm\_repository\_url](#input\_helm\_repository\_url) | (Optional) Repository URL to locate the requested chart, defaults to `https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner` | `string` | `"https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) Namespace to install the release into, defaults to `nfs-system` | `string` | `"nfs-system"` | no |
| <a name="input_nfs_server"></a> [nfs\_server](#input\_nfs\_server) | (Required) Hostname/IP of the NFS Server | `string` | n/a | yes |
| <a name="input_nfs_server_path"></a> [nfs\_server\_path](#input\_nfs\_server\_path) | (Required) Basepath of the mount point to be used | `string` | n/a | yes |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | (Optional) Number of replica pods to create, defaults to `1` | `number` | `1` | no |

## Outputs

No outputs.