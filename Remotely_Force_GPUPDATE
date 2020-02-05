# Forces a GPUPDATE of computers in the list.  Will then automatically reboot the machine.

$Path="C:\Users\$User\Desktop\Computers.csv"
$import = Import-Csv $Path

foreach($CN in $import)
{
$Computer = $CN.("Name")
$Computer  = $Computer
Invoke-GPUpdate -Computer $Computer -RandomDelayInMinutes 0 -force
Start-Sleep -s 15
Restart-Computer -ComputerName $Computer 
write-output "$Computer"
}
