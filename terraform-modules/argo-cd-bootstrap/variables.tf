# NOTE: the variables in this file are organized in alphabetical order.

variable "repository_version" {
  type        = string
  default     = "main" # TODO Change this to version of release and find a way to update it automatically with semantic-release
  nullable    = false
  description = "The branch or tag of the repository where the `values.yaml` files are to be retrieved."
}
