output "control_ip" {
  value = "${join(",", packet_device.rke_control.*.access_public_ipv4)}"
}

output "worker_ip" {
  value = "${join(",", packet_device.rke_worker.*.access_public_ipv4)}"
}
