resource "aws_iam_policy" "alb" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  description = "ALB Controller permissions"
  policy      = file("${path.module}/iam-policy.json")
}

