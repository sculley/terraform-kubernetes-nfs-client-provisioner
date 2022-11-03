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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.7.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.7.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_metrics_server"></a> [metrics\_server](#module\_metrics\_server) | git::https://gitlab.com/novatiq/ops/terraform/modules/terraform-aws-metrics-server-k8s.git | v0.0.4 |
| <a name="module_nfs-client-provisioner"></a> [nfs-client-provisioner](#module\_nfs-client-provisioner) | /Users/sculley/Terraform/Modules/terraform-kubernetes-nfs-client-provisioner | n/a |
| <a name="module_sftp"></a> [sftp](#module\_sftp) | git::https://gitlab.com/novatiq/ops/terraform/modules/terraform-all-sftp-k8s.git | v0.0.3 |

## Resources

| Name | Type |
|------|------|
| [helm_release.kubelet_rubber_stamp](https://registry.terraform.io/providers/hashicorp/helm/2.7.0/docs/resources/release) | resource |
| [helm_release.metallb](https://registry.terraform.io/providers/hashicorp/helm/2.7.0/docs/resources/release) | resource |
| [kubectl_manifest.ip_address_pool](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubectl_manifest.l2_advertisement](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.metallb](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/namespace) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/namespace) | resource |
| [kubernetes_persistent_volume_claim.data_volume](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_persistent_volume_claim.logs_volume](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_secret.gitlab_registry](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_client_certificate"></a> [kubernetes\_client\_certificate](#input\_kubernetes\_client\_certificate) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_client_key"></a> [kubernetes\_client\_key](#input\_kubernetes\_client\_key) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_cluster_ca_certificate"></a> [kubernetes\_cluster\_ca\_certificate](#input\_kubernetes\_cluster\_ca\_certificate) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#input\_kubernetes\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_host"></a> [kubernetes\_host](#input\_kubernetes\_host) | n/a | `any` | n/a | yes |
| <a name="input_metallb_helm_chart_version"></a> [metallb\_helm\_chart\_version](#input\_metallb\_helm\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_metallb_ip_address_pool_range"></a> [metallb\_ip\_address\_pool\_range](#input\_metallb\_ip\_address\_pool\_range) | n/a | `any` | n/a | yes |
| <a name="input_metrics_server_helm_chart_version"></a> [metrics\_server\_helm\_chart\_version](#input\_metrics\_server\_helm\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `any` | n/a | yes |
| <a name="input_nfs_mount_options"></a> [nfs\_mount\_options](#input\_nfs\_mount\_options) | n/a | `any` | n/a | yes |
| <a name="input_novatiq_gitlab_registry_token"></a> [novatiq\_gitlab\_registry\_token](#input\_novatiq\_gitlab\_registry\_token) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_sftp_helm_chart_version"></a> [sftp\_helm\_chart\_version](#input\_sftp\_helm\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_sftp_user_ssh_key"></a> [sftp\_user\_ssh\_key](#input\_sftp\_user\_ssh\_key) | n/a | `any` | n/a | yes |
| <a name="input_sftp_user_ssh_key_mount_path"></a> [sftp\_user\_ssh\_key\_mount\_path](#input\_sftp\_user\_ssh\_key\_mount\_path) | n/a | `any` | n/a | yes |
| <a name="input_sftp_users_conf"></a> [sftp\_users\_conf](#input\_sftp\_users\_conf) | n/a | `any` | n/a | yes |

## Outputs

No outputs.