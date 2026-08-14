resource "aws_route" "private_nat" {
  # Private route table ko select kar rahe hain.
  # Isi route table se private subnets associated hain.
  route_table_id = aws_route_table.private.id

  # Private subnet ke resources ko kisi bhi IPv4 Internet
  # destination ke liye ye default route use karna hai.
  destination_cidr_block = "0.0.0.0/0"

  # Internet ke liye traffic NAT Gateway ke through jayega.
  nat_gateway_id = aws_nat_gateway.main.id
}
