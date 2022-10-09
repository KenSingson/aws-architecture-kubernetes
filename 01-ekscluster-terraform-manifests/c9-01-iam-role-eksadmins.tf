# Resource: AWS IAM Role
resource "aws_iam_role" "eks_admin_role" {
  name = "${local.name}-eks-admin-role"

  assume_role_policy = jsonencode({
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
    }]
    Version = "2012-10-17"
  })

  inline_policy {
    name = "eks-full-access-policy"
    policy =  jsonencode({
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

  tags = {
    Name = "${local.name}-eks-admin-role"
  }
}