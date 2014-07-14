Function DisableACK($cluster) {
$AllHosts = Get-Cluster $cluster
foreach ($ESXHost in ($AllHosts | Get-VMHost | Get-View))
{
  $HostStorageSystemID = $ESXHost.configmanager.StorageSystem  
    $HostiSCSISoftwareAdapterHBAID = ($ESXHost.config.storagedevice.HostBusAdapter | where {$_.Model -match "iSCSI Software"}).device  
 	#Disable ACK
    $options = New-Object VMWare.Vim.HostInternetScsiHbaParamValue[] (1)  
    $options[0] = New-Object VMware.Vim.HostInternetScsiHbaParamValue  
    $options[0].key = "DelayedAck"  
    $options[0].value = $false  
       
    #This section applies the options above to the host you got the information from.  
    $HostStorageSystem = Get-View -ID $HostStorageSystemID  
    $HostStorageSystem.UpdateInternetScsiAdvancedOptions($HostiSCSISoftwareAdapterHBAID, $null, $options)  

}
								}