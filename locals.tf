locals {

  roles_with_policies = flatten([
    for role, details in var.roles : [
      for index, arn in details.managed_policy_arns : {
        role       = role
        policy_arn = arn
        key        = "${role}-${index}"
      }if length(details.managed_policy_arns) > 0
    ]
  ])
  roles_map = { for item in local.roles_with_policies : item.key => item }

  assume_role_policies = {
    ec2 = {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        }
      ]
    }
    lambda = {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        }
      ]
    }
    eks = {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "eks.amazonaws.com"
          }
        }
      ]
    }
  }
}
