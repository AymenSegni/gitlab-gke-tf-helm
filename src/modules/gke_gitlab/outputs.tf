output "gitlab_address" {
  value       = var.gitlab_address_name == "" ? google_compute_address.gitlab.0.address : data.google_compute_address.gitlab.0.address
  description = "IP address where you can connect to your GitLab instance"
}

output "gitlab_url" {
  value       = "https://gitlab.${google_compute_address.gitlab.0.address}.xip.io"
  description = "URL where you can access your GitLab instance"
}

output "root_password_instructions" {
  value = <<EOF
  Run the following commands to get the root user password:
  gcloud container clusters get-credentials gitlab --zone ${var.region} --project ${var.project_id}
  kubectl get secret gitlab-gitlab-initial-root-password -o go-template='{{ .data.password }}' | base64 -d && echo
  EOF

  description = "Instructions for getting the root user's password for initial setup"
}
