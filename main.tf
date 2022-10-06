resource "helm_release" "nfs_client_provisioner" {
  name       = var.helm_release_name
  repository = var.helm_repository_url
  chart      = var.helm_chart_name
  version    = var.helm_chart_version

  namespace  = var.namespace
  create_namespace = var.create_namespace

  values = [
    templatefile("${path.module}/templates/helm/values.yaml.tpl", {
      replica_count    = var.replica_count
      nfs_server       = var.nfs_server
      nfs_server_path  = var.nfs_server_path
      nfs_mount_options = var.nfs_mount_options
    }),
    var.values
  ]
}