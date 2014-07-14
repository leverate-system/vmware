﻿#Enable Update on powerCycle 
Get-VM | Get-View | ForEach-Object{
Write-Output $_.name
if ($_.config.tools.toolsUpgradePolicy -ne “upgradeAtPowerCycle” -and $_.Guest.GuestFamily -match “windowsGuest”){
$vm = Get-VM -Name $_.name
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.changeVersion = $vm.ExtensionData.Config.ChangeVersion
$spec.tools = New-Object VMware.Vim.ToolsConfigInfo
$spec.tools.toolsUpgradePolicy = “upgradeAtPowerCycle”
$_this = Get-View -Id $vm.Id 
$_this.ReconfigVM_Task($spec)
Write-Output “Completed”
}
}
