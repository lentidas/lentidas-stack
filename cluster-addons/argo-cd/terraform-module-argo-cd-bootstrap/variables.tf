variable "repository_version" {
  description = "The branch or tag of the repository where the `values.yaml` files are to be retrieved."
  type        = string
  default     = "main" # TODO Change this to version of release and find a way to update it automatically with semantic-release
}
