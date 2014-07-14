Get-Cluster “clustername” | Get-VMHost | Get-VirtualSwitch -Name “vSwitch0″ | New-VirtualPortGroup -Name “VLAN-Name” -VLanId 9
