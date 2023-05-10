hashicorp recommend using either a Service Principal or Managed Service Identity when running Terraform non-interactively 
(such as when running Terraform in a CI server) 
- and authenticating using the Azure CLI when running Terraform locally.

**Points-**
1- create a service principle going to azure AD  = App registration - new registration
2- GO to subscription  and assign contributor role to the service principle = Subscription -> IAM -> Add role assignments
3- create a secret in App registration- (ServicePrinciple/(APP Registration) name) - Certificates & secrets

Link -
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret




Terraform commands


az login 

az login --tenant 42c742c6-81a8-4f2a-a267-a831ea2e72f6

 az account set --subscription="Microsoft Azure Enterprise"


terraform init

terraform workspace show
   terraform workspace list
   terraform workspace select prod



export ARM_ACCESS_KEY="*******"
#we get this going to azure storage account -> access keys->show keys


export VAULT_TOKEN="****"

terraform plan -var-file=./environment/prod.tfvars
terraform plan -var-file=./environment/dev.tfvars


Resource group name = cxc-kpmg-collab-prod





1. terraform init
2. terraform plan -out=plan.out
3. terraform apply plan.out
![image](https://github.com/sshivanijoshi/terraform/assets/38161428/aa187f72-4383-4a14-8003-955478e8c20d)
