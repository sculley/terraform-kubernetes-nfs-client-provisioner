variable "helm_release_name" {
  description = "Release name (Name used when creating the helm chart)"
  type        = string
  default     = "nfs-client-provisioner"
}

variable "helm_repository_url" {
  description = "Repository URL to locate the requested chart"
  type        = string
  default     = "https://charts.helm.sh/stable"
}

variable "helm_chart_name" {
  description = "Chart name to be installed (Name of the chart to source/install)"
  type        = string
  default     = "nfs-client-provisioner"
}

variable "namespace" {
  description = "Namespace to install the release into"
  type        = string
  default     = "default"
}

variable "create_namespace" {
  description = "Create namespace"
  type        = bool
  default     = false
}

variable "replica_count" {
  description = "Number of replica pods to create"
  type        = number
  default     = 2
}

variable "nfs_server" {
  description = "Hostname/IP of the NFS Server"
  type        = string
  default     = ""
}

variable "nfs_server_path" {
  description = "Basepath of the mount point to be used"
  type        = string
  default     = "/mnt/kubernetes"
}

variable "image_repository" {
  description = "Provisioner image"
  type        = string
  default     = "quay.io/external_storage/nfs-client-provisioner"
}

variable "image_tag" {
  description = "Version of provisioner image"
  type        = string
  default     = "v3.1.0-k8s1.11"
}

variable "image_pullpolicy" {
  description = "Image pull policy"
  type        = string
  default     = "IfNotPresent"
}