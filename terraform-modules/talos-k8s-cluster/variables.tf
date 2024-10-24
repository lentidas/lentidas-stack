variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  nullable    = false
}

variable "cluster_endpoint" {
  description = "The endpoint of the Kubernetes cluster, usually a DNS name in the form `https://<control-plane-ip-or-vip-or-dns-name>:6443`. See the [official documentation](https://www.talos.dev/v1.8/introduction/prodnotes/#decide-the-kubernetes-endpoint) for instructions on how to choose an endpoint."
  type        = string
  nullable    = false

  # TODO Maybe add support to customize the K8s endpoint port in the future.
  validation {
    condition     = can(regex("https://[a-zA-Z0-9.-]+:6443", var.cluster_endpoint))
    error_message = "The cluster endpoint must be a valid URL in the form `https://<control-plane-ip-or-vip-or-dns-name>:6443`."
  }
}


