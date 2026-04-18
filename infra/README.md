# Bicep Infrastructure for PetClinic

This folder contains a minimal Bicep setup to provision the Azure infrastructure used by this project:

- Linux App Service Plan
- Linux Web App (Tomcat 10.1 + Java 17)

## 1) Prerequisites

- Azure CLI 2.53+ (2.76+ recommended)
- Logged in to Azure: `az login`
- Correct subscription selected: `az account set --subscription <subscription-id-or-name>`

## 2) Create resource group (if needed)

```bash
az group create --name myapp-rg --location eastus2
```

## 3) Preview changes (what-if)

```bash
az deployment group what-if \
  --name petclinic-infra-whatif \
  --resource-group myapp-rg \
  --parameters infra/main.dev.bicepparam
```

## 4) Deploy

```bash
az deployment group create \
  --name petclinic-infra-deploy \
  --resource-group myapp-rg \
  --parameters infra/main.dev.bicepparam
```

When using a `.bicepparam` file, do not pass `--template-file`.

## 5) Verify app endpoint

```bash
az webapp show --resource-group myapp-rg --name dt4-myapp-vikas --query defaultHostName -o tsv
```

Then open:

`https://<returned-hostname>/petclinic`

## Notes

- Your Azure DevOps pipeline currently deploys application artifacts to `dt4-myapp-vikas`.
- This Bicep setup is for provisioning/maintaining the Azure infra layer, while your pipeline handles WAR deployment.
