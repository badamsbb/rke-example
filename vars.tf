
variable "packet_api_key" {
  description = "Your packet API key"
  default = "Q3pApaGSR3NUNMXJjbQp4qmXwrwvtqtn"
}

variable "packet_project_id" {
  description = "Packet Project ID"
  default = "12569f54-5001-4e4e-bf4a-56fe92138aec"
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
  default = "/home/badams/workspace/ssh-keys/badams.pub"
}

variable "ssh_key_path" {
  description = "Path to your private SSH key for the project"
  default = "/home/badams/workspace/ssh-keys/badams"
}