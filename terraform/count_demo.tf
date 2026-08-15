resource "terraform_data" "count_demo" {
  count = 3

  input = "Server-${count.index + 1}"
}
