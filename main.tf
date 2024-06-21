resource "aws_iam_role" "this" {
  for_each = var.roles

  name = each.key

  assume_role_policy = jsonencode(local.assume_role_policies[each.value.assume_role_policy])
}

resource "aws_iam_policy" "this" {
  for_each = var.roles

  name        = each.value.policy_name
  description = each.value.policy_description

  policy = file(each.value.policy_file)
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.roles

  role       = aws_iam_role.this[each.key].name
  policy_arn = aws_iam_policy.this[each.key].arn
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  for_each = local.roles_map
  
  role       = each.value.role
  policy_arn = each.value.policy_arn

  depends_on = [ aws_iam_role.this ]
}


