provider "google" {
  project = var.project_id
}

provider "google-beta" {
  project = var.project_id
}

provider "helm" {
  service_account = "tiller"
  install_tiller  = true
  namespace       = "kube-system"

  kubernetes {
    host                   = google_container_cluster.gitlab.endpoint
    client_certificate     = base64decode(google_container_cluster.gitlab.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.gitlab.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.gitlab.master_auth.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  load_config_file       = false
  host                   = google_container_cluster.gitlab.endpoint
  client_certificate     = base64decode(google_container_cluster.gitlab.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.gitlab.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.gitlab.master_auth.0.cluster_ca_certificate)
}
