#User_Putter - Pete
$app_name = "Cisco Webex"
$app_role_name = "User"
$sp = Get-AzureADServicePrincipal -Filter "displayName eq '$app_name'"
$appRole = $sp.AppRoles | Where-Object { $_.DisplayName -eq $app_role_name }

foreach($username in Get-Content -Path .\Users.txt) {
    $user = Get-AzureADUser -ObjectId "$username"
    New-AzureADUserAppRoleAssignment -ObjectId $user.ObjectId -PrincipalId $user.ObjectId -ResourceId $sp.ObjectId -Id $appRole.Id
    Write-Output $username
}