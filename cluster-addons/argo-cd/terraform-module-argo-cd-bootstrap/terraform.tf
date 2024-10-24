terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.2.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.13.2"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 1.22.0"
    }
  }
}
