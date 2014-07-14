function restart-syslog($cluster) {
foreach ($esxhost in (Get-Cluster -Name $cluster | Get-VMHost )){
    Write-Host "ESX: $esxhost"
    $esxcli = Get-EsxCli -VMhost $esxhost    
    $esxcli.system.syslog.reload()
	}
}
