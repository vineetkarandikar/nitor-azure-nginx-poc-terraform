# # # Resource Group
# # provider "azurerm" {
# #   features {}
# #   subscription_id = "972e2591-f0b5-4881-a4ec-6faedc78134c"
# # }


# # resource "azurerm_resource_group" "Pranshu_nginx_poc_auth" {
# #   name     = "Pranshu-rg"
# #   location = "eastus"
# # }

# # # Virtual Network
# # resource "azurerm_virtual_network" "Pranshu_nginx_auth_poc_vnet" {
# #   name                = "Pranshu-nginx-auth-poc-vnet"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   address_space       = ["10.0.0.0/16"]
# # }

# # # Network Security Group
# # resource "azurerm_network_security_group" "Pranshu_private_nsg" {
# #   name                = "Pranshu-private-nsg"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # }

# # # Public IP Address
# # resource "azurerm_public_ip" "Pranshu_private_subnet" {
# #   name                = "Pranshu-private-subnet"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   sku                 = "Standard"
# #   allocation_method   = "Static"
# # }

# # # NAT Gateway
# # resource "azurerm_nat_gateway" "Pranshu_test_public_private_ngw" {
# #   name                = "Pranshu-test-public-private-ngw-1"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   sku_name            = "Standard"
# # }

# # # Log Analytics Workspaces
# # resource "azurerm_log_analytics_workspace" "Pranshu_workspace_nginx_poc_auth_8a6c" {
# #   name                = "Pranshu-workspacenginxpocauth8a6c"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   sku                 = "PerGB2018"
# #   retention_in_days   = 30
# # }

# # resource "azurerm_log_analytics_workspace" "Pranshu_workspace_nginx_poc_auth_b022" {
# #   name                = "Pranshu-workspacenginxpocauthb022"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   sku                 = "PerGB2018"
# #   retention_in_days   = 30
# # }

# # # Container Apps Environments
# # resource "azurerm_container_app_environment" "Pranshu_managed_env_nginx_poc_auth_8f3a" {
# #   name                = "Pranshu-managedEnvironment-nginxpocauth-8f3a"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # }

# # resource "azurerm_container_app_environment" "Pranshu_nginx_auth_poc_private_container_env" {
# #   name                = "Pranshu-nginx-auth-poc-private-container-env"
# #   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # }


# # resource "azurerm_container_app" "Pranshu_nginx" {
# #   name                         = "pranshunginx"
# #   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # #   tags                         = var.tags
# #   container_app_environment_id = azurerm_container_app_environment.Pranshu_managed_env_nginx_poc_auth_8f3a.id
# #   revision_mode                = "Single"

# #   identity {
# #     type = "SystemAssigned"
# #   }

# #   secret { 
# #     name  = "githubtoken" 
# #     value = var.github_token  # Make sure this is a sensitive variable containing the GitHub token
# #   }

# #   registry {
# #     server               = "ghcr.io"
# #     username             = "vineetkarandikar"  # Your GitHub username
# #     password_secret_name = "githubtoken"       # Reference to the secret holding the token
# #   }

# #   ingress {
# #     allow_insecure_connections = false
# #     external_enabled           = true
# #     target_port                = 80  # The port your Nginx app listens on
# #     traffic_weight {
# #       percentage      = 100
# #       latest_revision = true
# #     }
# #   }

# #   template {
# #     min_replicas = 1
# #     max_replicas = 2
# #     container {
# #       name   = "nginx-container"
# #       image  = "ghcr.io/vineetkarandikar/nginx-proxy-terraform-azure:latest"  # Your container image
# #       cpu    = 0.5
# #       memory = "1Gi"
# #     }
# #   }
# # }




# # resource "azurerm_container_app" "Pranshu_hello1" {
# #   name                         = "pranshuhello1"
# #   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
# #   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   revision_mode                = "Single"

# #   identity {
# #     type = "SystemAssigned"
# #   }

# #   secret { 
# #     name  = "githubtoken" 
# #     value = var.github_token  # Ensure this is a sensitive variable
# #   }

# #   registry {
# #     server               = "ghcr.io"
# #     username             = "vineetkarandikar"  # Your GitHub username
# #     password_secret_name = "githubtoken"       # Reference to the secret holding the token
# #   }

# #   ingress {
# #     allow_insecure_connections = false
# #     external_enabled           = true
# #     target_port                = 8000
# #     traffic_weight {
# #       percentage      = 100
# #       latest_revision = true
# #     }
# #   }

# #   template {
# #     min_replicas = 1
# #     max_replicas = 2
# #     container {
# #       name   = "hello1-container"
# #       image  = "ghcr.io/vineetkarandikar/hello-fast-api-1:hello1"  # Your container image
# #       cpu    = 0.25
# #       memory = "0.5Gi"
# #     }
# #   }
# # }

# # resource "azurerm_container_app" "Pranshu_hello2" {
# #   name                         = "pranshuhello2"
# #   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
# #   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   revision_mode                = "Single"

# #   identity {
# #     type = "SystemAssigned"
# #   }

# #   secret { 
# #     name  = "githubtoken" 
# #     value = var.github_token  # Ensure this is a sensitive variable
# #   }

# #   registry {
# #     server               = "ghcr.io"
# #     username             = "vineetkarandikar"  # Your GitHub username
# #     password_secret_name = "githubtoken"       # Reference to the secret holding the token
# #   }

# #   ingress {
# #     allow_insecure_connections = false
# #     external_enabled           = true
# #     target_port                = 8000
# #     traffic_weight {
# #       percentage      = 100
# #       latest_revision = true
# #     }
# #   }

# #   template {
# #     min_replicas = 1
# #     max_replicas = 2
# #     container {
# #       name   = "hello2-container"
# #       image  = "ghcr.io/vineetkarandikar/hello-fast-api-2:hello2"  # Your container image
# #       cpu    = 0.25
# #       memory = "0.5Gi"
# #     }
# #   }
# # }




# # # resource "azurerm_container_app" "Pranshu_hello1" {
# # #   name                       = "pranshuhello1"
# # #   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
# # #   resource_group_name        = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # # #   location                   = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# # #   revision_mode              = "Single"
# # #   template {
# # #     container {
# # #       name   = "hello1-container"
# # #       image  = "ghcr.io/vineetkarandikar/hello-fast-api-1:hello1"
# # #       cpu    = 0.25
# # #       memory = "0.5Gi"
# # #     }
# # #   }
# # # }

# # # resource "azurerm_container_app" "Pranshu_hello2" {
# # #   name                       = "pranshuhello2"
# # #   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
# # #   resource_group_name        = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # # #   location                   = azurerm_resource_group.Pranshu_nginx_poc_auth.location
# # #   revision_mode              = "Single"
# # #   template {
# # #     container {
# # #       name   = "hello2-container"
# # #       image  = "ghcr.io/vineetkarandikar/hello-fast-api-2:hello2"
# # #       cpu    = 0.25
# # #       memory = "0.5Gi"
# # #     }
# # #   }
# # # }

# # # Private DNS Zone
# # resource "azurerm_private_dns_zone" "Pranshu_bravecoast_dns_zone" {
# #   name                = "Pranshu-bravecoast-54dda9a2.eastus.azurecontainerapps.io"
# #   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# # }

# # # Private DNS Zone Virtual Network Link
# # resource "azurerm_private_dns_zone_virtual_network_link" "Pranshu_private_dns_test_1" {
# #   name                  = "Pranshu-private-dns-test-1"
# #   private_dns_zone_name = azurerm_private_dns_zone.Pranshu_bravecoast_dns_zone.name
# #   resource_group_name   = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# #   virtual_network_id    = azurerm_virtual_network.Pranshu_nginx_auth_poc_vnet.id
# # }


# ####################################
# # Provider Configuration
# provider "azurerm" {
#   features {}
#   subscription_id = "972e2591-f0b5-4881-a4ec-6faedc78134c"
# }

# # Resource Group
# resource "azurerm_resource_group" "Pranshu_nginx_poc_auth" {
#   name     = "Pranshu-rg"
#   location = "eastus"
# }

# # Virtual Network
# resource "azurerm_virtual_network" "Pranshu_nginx_auth_poc_vnet" {
#   name                = "Pranshu-nginx-auth-poc-vnet"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   address_space       = ["10.0.0.0/16"]
# }


# resource "azurerm_log_analytics_workspace" "Pranshu_workspace_nginx_poc_auth_b022" {
#   name                = "Pranshu-workspacenginxpocauthb022"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

# # Network Security Group
# resource "azurerm_network_security_group" "Pranshu_private_nsg" {
#   name                = "Pranshu-private-nsg"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# }

# # Public IP Address for Container App
# resource "azurerm_public_ip" "Pranshu_private_subnet" {
#   name                = "Pranshu-private-subnet"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   sku                 = "Standard"
#   allocation_method   = "Static"
# }

# # NAT Gateway (Optional, depending on your requirements)
# resource "azurerm_nat_gateway" "Pranshu_test_public_private_ngw" {
#   name                = "Pranshu-test-public-private-ngw-1"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   sku_name            = "Standard"
# }

# # Log Analytics Workspace
# resource "azurerm_log_analytics_workspace" "Pranshu_workspace_nginx_poc_auth_8a6c" {
#   name                = "Pranshu-workspacenginxpocauth8a6c"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

# # Container Apps Environments
# resource "azurerm_container_app_environment" "Pranshu_managed_env_nginx_poc_auth_8f3a" {
#   name                = "Pranshu-managedEnvironment-nginxpocauth-8f3a"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# }

# resource "azurerm_container_app_environment" "Pranshu_nginx_auth_poc_private_container_env" {
#   name                = "Pranshu-nginx-auth-poc-private-container-env"
#   location            = azurerm_resource_group.Pranshu_nginx_poc_auth.location
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# }

# # Container App 1 (nginx)


# # Container App 2 (hello1)
# resource "azurerm_container_app" "Pranshu_hello1" {
#   name                         = "pranshuhello1"
#   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
#   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   revision_mode                = "Single"

#   identity {
#     type = "SystemAssigned"
#   }

#   secret { 
#     name  = "githubtoken" 
#     value = var.github_token  # Ensure this is a sensitive variable
#   }

#   registry {
#     server               = "ghcr.io"
#     username             = "vineetkarandikar"  # Your GitHub username
#     password_secret_name = "githubtoken"       # Reference to the secret holding the token
#   }

#   ingress {
#     allow_insecure_connections = false
#     external_enabled           = true
#     target_port                = 80
#     traffic_weight {
#       percentage      = 100
#       latest_revision = true
#     }
#   }

#   template {
#     min_replicas = 1
#     max_replicas = 2
#     container {
#       name   = "hello1-container"
#       image  = "ghcr.io/vineetkarandikar/hello-fast-api-1:hello1"  # Your container image
#       cpu    = 0.25
#       memory = "0.5Gi"
#     }
#   }
# }

# # Private DNS Zone
# resource "azurerm_private_dns_zone" "Pranshu_bravecoast_dns_zone" {
#   name                = "Pranshu-bravecoast-54dda9a2.eastus.azurecontainerapps.io"
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
# }

# # Private DNS Zone Virtual Network Link
# resource "azurerm_private_dns_zone_virtual_network_link" "Pranshu_private_dns_test_1" {
#   name                  = "Pranshu-private-dns-test-1"
#   private_dns_zone_name = azurerm_private_dns_zone.Pranshu_bravecoast_dns_zone.name
#   resource_group_name   = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   virtual_network_id    = azurerm_virtual_network.Pranshu_nginx_auth_poc_vnet.id
# }

# # DNS A Record using Public IP
# resource "azurerm_dns_a_record" "Pranshu_nginx_a_record" {
#   name                = "nginx"  # The subdomain you want to create (e.g., nginx.pranshu.example.com)
#   zone_name           = azurerm_private_dns_zone.Pranshu_bravecoast_dns_zone.name
#   resource_group_name = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   ttl                 = 300
# #   records             = [azurerm_public_ip.Pranshu_private_subnet.ip_address]
#   records             =[azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.static_ip_address]  # Public IP address of your container app
# depends_on = [
#     azurerm_private_dns_zone.Pranshu_bravecoast_dns_zone
#   ]

# }


# resource "azurerm_container_app" "Pranshu_hello2" {
#   name                         = "pranshuhello2"
#   container_app_environment_id = azurerm_container_app_environment.Pranshu_nginx_auth_poc_private_container_env.id
#   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   revision_mode                = "Single"

#   identity {
#     type = "SystemAssigned"
#   }

#   secret { 
#     name  = "githubtoken" 
#     value = var.github_token  # Ensure this is a sensitive variable
#   }

#   registry {
#     server               = "ghcr.io"
#     username             = "vineetkarandikar"  # Your GitHub username
#     password_secret_name = "githubtoken"       # Reference to the secret holding the token
#   }

#   ingress {
#     allow_insecure_connections = false
#     external_enabled           = true
#     target_port                = 80
#     traffic_weight {
#       percentage      = 100
#       latest_revision = true
#     }
#   }

#   template {
#     min_replicas = 1
#     max_replicas = 2
#     container {
#       name   = "hello2-container"
#       image  = "ghcr.io/vineetkarandikar/hello-fast-api-2:hello2"  # Your container image
#       cpu    = 0.25
#       memory = "0.5Gi"
#     }
#   }
# }

# resource "azurerm_container_app" "Pranshu_nginx" {
#   name                         = "pranshunginx"
#   resource_group_name          = azurerm_resource_group.Pranshu_nginx_poc_auth.name
#   container_app_environment_id = azurerm_container_app_environment.Pranshu_managed_env_nginx_poc_auth_8f3a.id
#   revision_mode                = "Single"

#   identity {
#     type = "SystemAssigned"
#   }

#   secret { 
#     name  = "githubtoken" 
#     value = var.github_token  # Make sure this is a sensitive variable containing the GitHub token
#   }

#   registry {
#     server               = "ghcr.io"
#     username             = "vineetkarandikar"  # Your GitHub username
#     password_secret_name = "githubtoken"       # Reference to the secret holding the token
#   }

#   ingress {
#     allow_insecure_connections = false
#     external_enabled           = true
#     target_port                = 80  # The port your Nginx app listens on
#     traffic_weight {
#       percentage      = 100
#       latest_revision = true
#     }
#   }

#   template {
#     min_replicas = 1
#     max_replicas = 2
#     container {
#       name   = "nginx-container"
#       image  = "ghcr.io/vineetkarandikar/nginx-proxy-terraform-azure:latest"  # Your container image
#       cpu    = 0.5
#       memory = "1Gi"
#     }
#   }
# }