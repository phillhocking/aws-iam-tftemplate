provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_iam_user" "instanceManageUser" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "instanceManageUser" {
  user = aws_iam_user.instanceManageUser.name
}

data "template_file" "policy" {
  template = file("${path.module}/policy.json.tpl")
}

resource "aws_iam_user_policy" "instanceManageUser_assume_role" {
  name = var.iam_policy_name
  user = aws_iam_user.instanceManageUser.name

  policy = data.template_file.policy.rendered
}
