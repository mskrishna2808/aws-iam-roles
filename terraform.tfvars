roles = {
    "example-role-1" = {
      assume_role_policy = "ec2" # Select predefined assume role policy
      policy_name        = "example_policy_1"
      policy_file        = "policies/policy1.json"
      policy_description = "Policy for example-role-1"
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
        "arn:aws:iam::aws:policy/AmazonS3FullAccess" # Managed policy ARN
      ]
    },
    "example-role-2" = {
      assume_role_policy = "lambda" # Select predefined assume role policy
      policy_name        = "example_policy_2"
      policy_file        = "policies/policy2.json"
      policy_description = "Policy for example-role-2"
      managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
    },
    "example-role-3" = {
      assume_role_policy = "eks" # Select predefined assume role policy
      policy_name        = "example_policy_3"
      policy_file        = "policies/policy3.json"
      policy_description = "Policy for example-role-3"
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess" # Managed policy ARN
      ]
    }
}
