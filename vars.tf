
variable "packet_api_key" {
  description = "Your packet API key"
}

variable "packet_project_id" {
  description = "Packet Project ID"
}

variable "rke_control_count" {
  default = "1"
  description = "Number of K8s nodes."
}

variable "rke_worker_count" {
  default = "0"
  description = "Number of K8s nodes."
}

variable "ssh_public_key_path" {
  description = "Path to your public SSH key path"
  default = "./key.pub"
}

variable "ssh_private_key_path" {
  description = "Path to your private SSH key for the project"
  default = "./key"
}