resource "helm_release" "nfs-client-provisioner" {
  name       = var.helm_release_name
  repository = var.helm_repository_url
  chart      = var.helm_chart_name

  namespace  = var.namespace
  create_namespace = var.create_namespace

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      replica_count    = var.replica_count
      nfs_server       = var.nfs_server
      nfs_server_path  = var.nfs_server_path
      image_repository = var.image_repository
      image_tag        = var.image_tag
      image_pullpolicy = var.image_pullpolicy
    })
  ]
}