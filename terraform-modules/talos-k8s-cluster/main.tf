# Generate the machine secrets for the Talos cluster.
resource "talos_machine_secrets" "this" {}

# TODO Add comment to explain the purpose of the data block
# TODO Add way to specify the Kubernetes version
# TODO Add way to specify the Talos version to use
data "talos_machine_configuration" "controlplane" {
  cluster_name     = var.cluster_name
  cluster_endpoint = var.cluster_endpoint
  machine_type     = "controlplane"
  machine_secrets  = resource.talos_machine_secrets.this.machine_secrets
}

# TODO Add comment to explain the purpose of the data block
# TODO Add way to specify the Kubernetes version
# TODO Add way to specify the Talos version to use
data "talos_machine_configuration" "worker" {
  cluster_name     = var.cluster_name
  cluster_endpoint = var.cluster_endpoint
  machine_type     = "worker"
  machine_secrets  = resource.talos_machine_secrets.this.machine_secrets
}
