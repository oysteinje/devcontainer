Function Set-Subscription {
    param(
        $Name,
        $TenantId = (Get-AzContext).Tenant.Id
    )
    $currentSub = Get-AzContext

    # Get subscriptions
    $Subscriptions = Get-AzSubscription -TenantId $TenantId -WarningAction Ignore | Where-Object name -Match $Name | Sort-Object -Property Name
    $Subs = @()

    # Add numbers to subscription
    $index = 0
    $Subscriptions | ForEach-Object {
        $obj = [PSCustomObject] @{ Number = $index; Name = $_.Name; Id = $_.id; TenantId = $_.TenantId; State = $_.State }
        $Subs += $obj
        $index++
    }

    # Choose subscription
    do {
        $Subs | Format-Table
        $select = Read-Host -Prompt 'Select a subscription'
        $ChosenSubscription = $Subs[$select]
    } until ($null -ne $ChosenSubscription)

    # Set the chosen subscription
    Set-AzContext -SubscriptionId $ChosenSubscription.Id -TenantId $ChosenSubscription.TenantId | Format-List -Property name, account, subscription, tenant

}

Function Load-Env {
    param(
        $EnvFile
    )

    # Add code here . . .
}

Function Connect-Environment {
    param(
        $TenantId = $env:AZURE_TENANT_ID,
        $SubscriptionId = $env:AZURE_SUBSCRIPTION_ID
    )

    Connect-AzAccount -TenantId $TenantId -SubscriptionId $SubscriptionId -UseDeviceAuthentication
}

Export-ModuleMember -Function Load-Env
Export-ModuleMember -Function Set-Subscription
Export-Modulemember -Function Connect-Environment
