resource "aws_ssm_parameter" "ingress_alb_listener_arn" {
  name  = "/${var.project}/${var.environment}/ingress_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.ingress_alb.arn
}