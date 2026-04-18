targetScope = 'resourceGroup'

@description('Azure region for all resources.')
param location string = resourceGroup().location

@description('App Service plan name.')
param appServicePlanName string

@description('Linux Web App name. Must be globally unique in Azure App Service.')
param webAppName string

@description('App Service plan SKU name.')
@allowed([
  'B1'
  'S1'
  'P1v3'
])
param skuName string = 'B1'

@description('App Service plan SKU tier.')
@allowed([
  'Basic'
  'Standard'
  'PremiumV3'
])
param skuTier string = 'Basic'

@description('Runtime stack for Linux Web App.')
param linuxFxVersion string = 'TOMCAT|10.1-java17'

@description('Tags for deployed resources.')
param tags object = {}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  kind: 'linux'
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    reserved: true
  }
  tags: tags
}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      alwaysOn: skuTier == 'Basic' ? false : true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      scmMinTlsVersion: '1.2'
      http20Enabled: true
    }
  }
  tags: tags
}

output webAppName string = webApp.name
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'
output appServicePlanId string = appServicePlan.id
