resource "terraform_data" "foreach_demo" {
  for_each = toset(["Dev", "Stage", "Prod"])

  input = each.key
}
