variable "shared_config_files" {
  description = "aws configure config file"
  default = []
}

variable "shared_credentials_files" {
  description = "aws configure creds file"
  default = []
}

output "sonarqube-public-ip" {
  value = aws_instance.app-sonarqube.public_ip
}

output "k8s-public_ip" {
  value = aws_instance.app-k8s-minikube.public_ip
}