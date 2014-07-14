#Backup ESXI configurations from PowerCLI
#First thing is to set ESXI to maintenance mode

Set-VMHost -VMHost ESXi_host_IP_address -State 'Maintenance'

Get-VMHostFirmware -VMHost ESXi_host_IP_address -BackupConfiguration -DestinationPath output_directory

#For example:
#
#Get-VMHostFirmware -VMHost 10.0.0.1 -BackupConfiguration -DestinationPath C:\Downloads
#
#Note: A backup file is saved in the directory specified with the -DestinationPath option.
Set-VMHostFirmware -VMHost ESXi_host_IP_address -Restore -SourcePath C:\Downloads\bundleToRestore.tgz -HostUser root -HostPassword exampleRootPassword 