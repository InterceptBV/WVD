# Edit template parameters
$templateFile = "https://raw.githubusercontent.com/InterceptBV/WVD/master/CreateHostpoolTemplate.ps1"

#Deploy from Git template
#https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-azure-button
$EncodedURI = [uri]::EscapeDataString($templateFile)

Start "https://portal.azure.com/#create/Microsoft.Template/uri/$EncodedURI"

