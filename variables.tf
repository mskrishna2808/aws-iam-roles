variable "roles" {
  description = "A map of roles to create with their corresponding assume role policies and policies"
  type = map(object({
    assume_role_policy  = string # This will be the key to select the predefined policy
    policy_name         = string
    policy_file         = string
    policy_description  = string
    managed_policy_arns = list(string) # List of managed policy ARNs to attach
  }))
}
