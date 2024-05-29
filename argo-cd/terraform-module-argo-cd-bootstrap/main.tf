data "github_repository_file" "chart_definition" {
  repository = "lentidas/helm-cluster-addon-argo-cd"
  branch     = var.repository_version
  file       = "Chart.yaml"
}

data "github_repository_file" "values_common" {
  repository = "lentidas/helm-cluster-addon-argo-cd"
  branch     = var.repository_version
  file       = "values-common.yaml"
}

data "github_repository_file" "values_bootstrap" {
  repository = "lentidas/helm-cluster-addon-argo-cd"
  branch     = var.repository_version
  file       = "values-bootstrap.yaml"
}

data "utils_deep_merge_yaml" "values" {
  input = [
    data.github_repository_file.values_common.content,
    data.github_repository_file.values_bootstrap.content,
  ]
  append_list = true
}

resource "helm_release" "argo_cd_bootstrap" {
  name = "argo-cd"

  repository = yamldecode(data.github_repository_file.chart_definition.content).dependencies[0].repository
  chart      = yamldecode(data.github_repository_file.chart_definition.content).dependencies[0].name
  version    = yamldecode(data.github_repository_file.chart_definition.content).dependencies[0].version

  namespace        = "argo-cd"
  create_namespace = true
  values           = [data.utils_deep_merge_yaml.values.output]

  lifecycle {
    ignore_changes = all
  }
}
