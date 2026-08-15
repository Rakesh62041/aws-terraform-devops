resource "terraform_data" "lifecycle_demo" {
  input = "Lifecycle Demo"

  lifecycle {
    create_before_destroy = true
  }
}
