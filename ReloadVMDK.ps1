#Reload VMKD, orphan VM or unknown status VM
#vim-cmd solo/register (full path of VMX) 

(Get-View -ViewType VirtualMachine) |?{$_.Runtime.ConnectionState -eq "invalid" -or $_.Runtime.ConnectionState -eq "inaccessible"} |%{$_.reload()}

#Get Inaccessible Virtual Machines
$VMs = Get-View -ViewType VirtualMachine | ?{$_.Runtime.ConnectionState -eq "invalid" -or $_.Runtime.ConnectionState -eq "inaccessible"} | select name,@{Name="GuestConnectionState";E={$_.Runtime.ConnectionState}}

write-host "---------------------------"
Write-host "Inaccessible VMs"
write-host "---------------------------"

$VMs

#Reload VMs into inventory
Get-View -ViewType VirtualMachine | ?{$VMs} | %{$_.reload()}

#Show new state of reloaded VMs
$ReloadedVMs = Get-View -ViewType VirtualMachine | ?{$VMs} | select name,@{Name="GuestConnectionState";E={$_.Runtime.ConnectionState}}

write-host "---------------------------"
write-host "Reloaded VMs"
write-host "---------------------------"


$ReloadedVMs