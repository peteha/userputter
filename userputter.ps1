#User_Putter
$app_name = "Cisco Webex"
$app_role_name = "User"
$sp = Get-AzureADServicePrincipal -Filter "displayName eq '$app_name'"
$appRole = $sp.AppRoles | Where-Object { $_.DisplayName -eq $app_role_name }

foreach($username in Get-Content -Path .\Users.txt) {
    $user = Get-AzureADUser -ObjectId "$username"
    Write-Output $user
}