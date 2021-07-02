resource "aws_iam_user" "iam-user" {
  name = var.iam-user
  path = "/"
  force_destroy = true
  tags = {
    About = "User happy join developement team"
  }
}

resource "aws_iam_user_login_profile" "iam-user-login-profile" {
    user = aws_iam_user.iam-user.name
    pgp_key = "keybase:biplabrout"
    password_reset_required = true
}

resource "aws_iam_access_key" "iam-user-access-key" {
  user = aws_iam_user.iam-user.name
  pgp_key = "keybase:biplabrout"
  status = "Active"
}

resource "aws_iam_group" "iam-group" {
    name = var.iam-group
    path = "/"
}

resource "aws_iam_user_group_membership" "iam-group-mem" {
  user = aws_iam_user.iam-user.name
  groups = [aws_iam_group.iam-group.name]
}

resource "aws_iam_group_policy" "iam-group-policy" {
  name  = "Developer-Policy"
  group = aws_iam_group.iam-group.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1625250363544",
      "Action": "ec2:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1625250648698",
      "Action": "ec2:*",
      "Effect": "Allow",
      "Resource": "arn:aws:ec2:eu-west-1:100218182105:instance/*"
    }
  ]
})
}

output "group-name"{
  value = aws_iam_group.iam-group.name
}

output "user-name"{
  value = aws_iam_user.iam-user.name
}

output "polciy-name"{
  value = aws_iam_group_policy.iam-group-policy.name
}

output "password" {
  value = aws_iam_user_login_profile.iam-user-login-profile.encrypted_password
}

output "secret-key"{
  value = aws_iam_access_key.iam-user-access-key.encrypted_secret
}
