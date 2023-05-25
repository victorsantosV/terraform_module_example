locals {
  kubernetes_manifests = fileset(path.module,"k8s_yml/redis.yaml")
  kubernetes_manifests_string = join(" ", local.kubernetes_manifests)
}

resource "null_resource" "apply_kubernetes_manifests" {

  triggers = {
    cluster_name    = var.gke_autopilot_cluster_name
    kubernetes_manifests = local.kubernetes_manifests_string
  }

  provisioner "local-exec" {
    working_dir = path.module
    command = <<-EOT
      for file in ${local.kubernetes_manifests_string}; do
        gcloud container clusters get-credentials ${var.gke_autopilot_cluster_name} --region ${var.region} --project ${var.project_id}
        kubectl apply -f "$${file}"
        echo "$${file}"
        echo $${file}
      done
    EOT
  }
}
