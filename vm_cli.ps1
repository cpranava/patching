param (
    [Parameter(Mandatory=$true)][string]$vcenter_server,
    [Parameter(Mandatory=$true)][string]$vcenter_user,
    [Parameter(Mandatory=$true)][string]$vcenter_password
 )

#Connecting to vCenter
Connect-VIServer -Server $vcenter_server -User $vcenter_user -Password $vcenter_password | Out-Null


#Listing all PoweredOff VM
$vms = Get-VM | where {$_.PowerState -eq "PoweredOff"}


#Spliting Only Names of Powered Off VMs
$vmPoweredOff = $vms | %{$_.Name}
#Write-Output -InputObject "`n All PoweredOff VM Names only"
#Write-Output -InputObject "###############################"
#Write-Output  $vmPoweredOff

#Events to check wheather it is 30days old
#NOTE Replace  0   with  30
$events = Get-VIEvent -Start (Get-Date).AddDays(-30) -Entity $vms |   where{$_.FullFormattedMessage -like "*is powered off"}
$lastMonthVM = $events | %{$_.Vm.Name}


#Fetching only Names of VM Shutdown from last 30Days
$moreThan1Month = $vmPoweredOff | where {!($lastMonthVM -contains $_)}
#Write-Output -InputObject "`n VM that is powered off from last 30Days"
#Write-Output -InputObject "#########################################"
Write-Output $moreThan1Month
