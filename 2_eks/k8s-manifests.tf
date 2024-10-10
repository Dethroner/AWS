data "kubectl_path_documents" "docs" {
  pattern = "./manifests/*.yaml"
}

resource "kubectl_manifest" "run" {

  depends_on = [module.eks]

  for_each  = toset(data.kubectl_path_documents.docs.documents)
  yaml_body = each.value
}