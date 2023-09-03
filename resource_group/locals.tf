locals {
  users = {
    "user01" = { name = "user01" }
    "user02" = { name = "user02" }
  }

  resource_groups = [
    {
      suffix   = "sandbox"
      location = "eastus"
    },
    {
      suffix   = "dev"
      location = "westeurope"
    }
  ]

  # Create a list of User and Resource Group Sets
  user_resource_groups_list = setproduct(values(local.users), local.resource_groups)

  # Create a map of User and Resource Group Sets from the list
  user_resource_groups_map = {
    for item in local.user_resource_groups_list :
    format("%s-%s", item[0]["name"], item[1]["suffix"]) => {
      username            = item[0]["name"],
      resource_group_name = format("%s-%s", item[0]["name"], item[1]["suffix"]),
      suffix              = item[1]["suffix"],
      location            = item[1]["location"],
    }
  }
}
