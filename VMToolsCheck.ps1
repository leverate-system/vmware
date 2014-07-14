#List VMs which require a VMware Tools upgrade:
#Using the ExtensionData.Guest.ToolsStatus value we can query the state of VMware Tools on the VMs.
Write-Host “================================================================”
Write-Host “These VMs need VMware Tools updating”
Write-Host “================================================================”
Get-VM | Where-Object {$_.ExtensionData.Guest.ToolsStatus -eq “toolsOld”}
Write-Host “================================================================”
Write-Host “These VMs are powered on, and do not have VMware Tools installed”
Write-Host “================================================================”
Get-VM | where {$_.powerstate -match “On”} | Where-Object {$_.ExtensionData.Guest.ToolsStatus -eq “ToolsNotInstalled”} 
