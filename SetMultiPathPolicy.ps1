#Set VMFS Path Selection to Round Robin
get-cluster “Cluster-Name*” | Get-VMHost | Get-ScsiLun -LunType disk | Where-Object {$_.MultipathPolicy -ne “RoundRobin”} | Set-ScsiLun -MultipathPolicy “RoundRobin”
#Disable I/O control 
get-datastore | where{$_.storageIOControlenabled -eq ‘True’} | set-datastore -StorageIOControlEnabled $false