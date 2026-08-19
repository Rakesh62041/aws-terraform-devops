resource "aws_lb_listener" "http" {
  #checkov:skip=CKV_AWS_2:HTTPS requires ACM certificate and domain
  #checkov:skip=CKV_AWS_103:TLS listener requires ACM certificate and domain

  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}
