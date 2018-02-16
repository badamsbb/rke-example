provider "packet" {
  auth_token = "${var.packet_api_key}"
}

resource "packet_ssh_key" "badams_key" {
  name       = "badams"
  public_key = "${file("${var.ssh_public_key_path}")}"
}

resource "packet_device" "rke_control" {
  hostname = "${format("rke-control-%02d", count.index)}"
  operating_system = "ubuntu_16_04"
  plan             = "baremetal_0"
  count            = "${var.rke_control_count}"
  facility         = "ams1"
  project_id       = "${var.packet_project_id}"
  billing_cycle    = "hourly"
  connection {
    user = "root"
    private_key = "${file("${var.ssh_private_key_path}")}"
  }

  depends_on = [
    "packet_ssh_key.badams_key"
  ]

  provisioner "remote-exec" {
    inline = [
      "apt update -q && apt install -qy apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "apt update -q && apt install -qy docker-ce=17.03.0~ce-0~ubuntu-xenial"
    ]
  }
}

resource "packet_device" "rke_worker" {
  hostname = "${format("rke-worker-%02d", count.index)}"
  operating_system = "ubuntu_16_04"
  plan             = "baremetal_1"
  count            = "${var.rke_worker_count}"
  facility         = "ams1"
  project_id       = "${var.packet_project_id}"
  billing_cycle    = "hourly"
  connection {
    user = "root"
    private_key = "${file("${var.ssh_private_key_path}")}"
  }

  depends_on = [
    "packet_ssh_key.badams_key"
  ]

  provisioner "remote-exec" {
    inline = [
      "apt update -q && apt install -qy apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "apt update -q && apt install -qy docker-ce=17.03.0~ce-0~ubuntu-xenial"
    ]
  }
}