# Resource: AWS IAM Role
resource "aws_iam_role" "eks_readonly_role" {
  name = "${local.name}-eks-readonly-role"

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
    name = "eks-readonly-access-policy"
    policy =  jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Action = [
          "iam:ListRoles",
          "ssm:GetParameter",
          "eks:DescribeNodeGroup",
          "eks:ListNodegroups",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:AccessKubernetesApi",
          "eks:ListUpdates",
          "eks:ListFargateProfiles",
          "eks:ListIdentityProviderConfigs",
          "eks:ListAddons",
          "eks:DescribeAddonVersions",
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