param name string
param location string = resourceGroup().location
param sku string = 'Free'
param repositoryUrl string = 'https://github.com/akhilsai0099/staticwebapptest.git'
param branch string = 'main'
param appLocation string = '/'
param apiLocation string = 'api'
param appArtifactLocation string = 'dist'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: name
  location: location
  tags: {
    'azd-service-name': 'static_web_app_test'
  }
  sku: {
    name: sku
    tier: sku
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    buildProperties: {
      appLocation: '.'
      apiLocation: 'api'
      outputLocation: 'build'
      appBuildCommand: 'npm run build'
      apiBuildCommand: 'npm run build --if-present'
    }
  }
}

output staticWebAppId string = staticWebApp.id
output staticWebAppDefaultHostname string = staticWebApp.properties.defaultHostname
