# Resource: AWS IAM User - Basic User (Has FULL AWS Access)
resource "aws_iam_user" "basic_user" {
  name = "${local.name}-eks-admin2"
  path = "/"

  force_destroy = true
  tags = local.common_tags
}

# Resource: Admin Access Policy - Attach it to admin user
resource "aws_iam_user_policy" "basic_user_eks_policy" {
  name = "${local.name}-eks-full-access-policy"
  user = aws_iam_user.basic_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "iam:ListRoles",
        "eks:*",
        "ssm:GetParameter"
      ]
      Effect = "Allow"
      Resource = "*"
    },]
  })
}