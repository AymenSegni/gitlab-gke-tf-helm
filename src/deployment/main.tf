# Deploy Gitlab module

provider "google" {}

// Deployments 
module "gitlab" {
  source              = "../modules/gke_gitlab"
  project_id                 = var.project_id
  certmanager_email          = var.certmanager_email
}
