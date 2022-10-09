# Resource: AWS IAM User - Admin User (Has FULL AWS Access)
resource "aws_iam_user" "admin_user" {
  name = "${local.name}-eks-admin1"
  path = "/"

  force_destroy = true
  tags = local.common_tags
}

# Resource: Admin Access Policy - Attach it to admin user
resource "aws_iam_user_policy_attachment" "administrator_access" {
  user = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}