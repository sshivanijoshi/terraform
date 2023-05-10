hashicorp recommend using either a Service Principal or Managed Service Identity when running Terraform non-interactively 
(such as when running Terraform in a CI server) 
- and authenticating using the Azure CLI when running Terraform locally.

**Points-**
1- create a service principle going to azure AD  = App registration - new registration
2- GO to subscription  and assign contributor role to the service principle = Subscription -> IAM -> Add role assignments
3- create a secret in App registration- (ServicePrinciple/(APP Registration) name) - Certificates & secrets

Link -
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
