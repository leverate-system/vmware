#Upgrade VM Tools, on all VM's in Cluster
#Without Restart
Get-Cluster "Cluster-Name" | Get-VM | Update-Tools –NoReboot
#Upgrade Tools, located in specific folder
Get-Cluster "Cluster-Name" | Get-Folder "Folder-Name" | Get-VM | Update-Tools –NoReboot
#Upgrade VMware Tools, on selected virtual machine
Get-Cluster "Cluster-Name" | Get-VM "CRM-CLI3" | Update-Tools –NoReboot
