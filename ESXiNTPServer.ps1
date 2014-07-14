Function NTPupdate($Cluster) {
$Hosts = Get-Cluster $Cluster | Get-VMHost
ForEach ($Host in $Hosts)
{
Remove-VmHostNtpServer -NtpServer "<old ntp server>" -VMHost $Host | Out-Null  #Remove OLD NTP
Add-VmHostNtpServer -NtpServer "<new ntp server>" -VMHost $Host | Out-Null #Add new NTP
Get-VmHostService -VMHost $Host | Where-Object {$_.key -eq "ntpd"} | Restart-VMHostService -Confirm:$false | Out-Null
write "NTP Server was changed on $Host"
}
}