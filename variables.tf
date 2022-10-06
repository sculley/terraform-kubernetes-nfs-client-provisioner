variable "create_namespace" {
  description = "(Optional) Create namespace, defaults to `false`"
  type        = bool
  default     = false
}

variable "helm_chart_name" {
  description = "(Optional) Chart name to be installed (Name of the chart to source/install), defaults to `nfs-subdir-external-provisioner`"
  type        = string
  default     = "nfs-subdir-external-provisioner"
}

variable "helm_chart_version" {
  description = "(Optional) Chart version to be installed (Version of the chart to source/install, defaults to `4.0.17`)"
  type        = string
  default     = "4.0.17"
}

variable "helm_release_name" {
  description = "(Optional) Release name (Name used when creating the helm chart), defaults to `nfs-client-provisioner`"
  type        = string
  default     = "nfs-client-provisioner"
}

variable "helm_repository_url" {
  description = "(Optional) Repository URL to locate the requested chart, defaults to `https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner`"
  type        = string
  default     = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner"
}

variable "namespace" {
  description = "(Optional) Namespace to install the release into, defaults to `nfs-system`"
  type        = string
  default     = "nfs-system"
}

variable "nfs_server" {
  description = "(Required) Hostname/IP of the NFS Server"
  type        = string
}

variable "nfs_server_path" {
  description = "(Required) Basepath of the mount point to be used"
  type        = string
}

variable "nfs_mount_options" {
  description = "(Optional) Mount options for the NFS mount, defaults to `vers=4.1`"
}

variable "replica_count" {
  description = "(Optional) Number of replica pods to create, defaults to `1`"
  type        = number
  default     = 1
}

variable "values" {
  description = "(Optional) The nfs-client-provisioner helm chart values yaml"
  type        = string
  default     = ""
}
