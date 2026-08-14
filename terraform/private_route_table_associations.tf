# ============================================================
# PRIVATE SUBNET 1 → PRIVATE ROUTE TABLE
# ============================================================

resource "aws_route_table_association" "private_1" {

  # Ye batata hai ki Private Subnet 1 ko
  # kis Route Table ke saath connect karna hai.
  #
  # aws_route_table.private.id
  # = hamara newly created Private Route Table
  route_table_id = aws_route_table.private.id

  # Ye hamara Private Subnet 1 hai.
  #
  # aws_subnet.private_1.id
  # = 10.0.11.0/24 wala private subnet
  subnet_id = aws_subnet.private_1.id
}


# ============================================================
# PRIVATE SUBNET 2 → PRIVATE ROUTE TABLE
# ============================================================

resource "aws_route_table_association" "private_2" {

  # Private Subnet 2 ko bhi
  # same Private Route Table se connect kar rahe hain.
  route_table_id = aws_route_table.private.id

  # aws_subnet.private_2.id
  # = 10.0.12.0/24 wala private subnet
  subnet_id = aws_subnet.private_2.id
}
