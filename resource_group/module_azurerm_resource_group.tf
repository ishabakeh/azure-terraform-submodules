module "azurerm_resource_group" {
  for_each = local.user.resource_group_map

  source = "../azure-terraform/azurerm_resource_group"

  name     = each.value.resource_group_name
  location = each.value.resource_group_name

}


output "resource_groups" {
  value = var.enable_module_output ? module.module_azurerm_resource_group[*] : null
}

output "user_resource_groups_list" {
  value = var.enable_module_output ? local.user_resource_groups_list : null
}

output "user_resource_groups_map" {
  value = var.enable_module_output ? local.user_resource_groups_map : null
}