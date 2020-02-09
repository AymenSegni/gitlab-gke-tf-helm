output "gitlab_url" {
  value = "${module.gke-gitlab.gitlab_url}"
}

output "root_password_instructions" {
  value = "${module.gke-gitlab.root_password_instructions}"
}
