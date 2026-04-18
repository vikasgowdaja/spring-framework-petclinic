using './main.bicep'

param appServicePlanName = 'dt4-myapp-plan-vikas'
param webAppName = 'dt4-myapp-vikas'
param skuName = 'B1'
param skuTier = 'Basic'
param linuxFxVersion = 'TOMCAT|10.1-java17'
param tags = {
  project: 'spring-framework-petclinic'
  environment: 'dev'
  managedBy: 'bicep'
}
