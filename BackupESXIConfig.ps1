#Backup ESXI configurations from PowerCLI

Get-VMHostFirmware -VMHost ESXi_host_IP_address -BackupConfiguration -DestinationPath output_directory

#For example:
#
#Get-VMHostFirmware -VMHost 10.0.0.1 -BackupConfiguration -DestinationPath C:\Downloads
#
#Note: A backup file is saved in the directory specified with the -DestinationPath option.
