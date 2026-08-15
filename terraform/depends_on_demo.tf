resource "terraform_data" "first" {
  input = "First Resource"
}

resource "terraform_data" "second" {
  input = "Second Resource"

  depends_on = [
    terraform_data.first
  ]
}
