Function Enable-MemHotAdd($vm){
$vmview = Get-vm $vm | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
 
$extra = New-Object VMware.Vim.optionvalue
$extra.Key="mem.hotadd"
$extra.Value="true"
$vmConfigSpec.extraconfig += $extra
 
$vmview.ReconfigVM($vmConfigSpec)
}
$vms = Get-VM 
foreach ($vm in $vms) {
      Enable-MemHotAdd ($vm)
}
