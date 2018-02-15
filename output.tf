output "control_ip" {
  value = "${join(",", packet_device.rke_control.*.network.0.address)}"
s
}
output "worker_ip" {
  value = "${join(",", packet_device.rke_worker.*.network.0.address)}"
}
