output "gitlab_url" {
  value = module.gitlab_gke.gitlab_url
}

output "root_password_instructions" {
  value = module.gitlab_gke.root_password_instructions
}
