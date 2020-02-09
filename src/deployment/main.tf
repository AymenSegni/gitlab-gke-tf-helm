# Deploy Gitlab module

module "gitlab" {
  source              = "../modules/gitlab_gke"
  project_id                 = "<PROJECT ID>"
  certmanager_email          = "test@example.com"
}
