#Uses a .csv file with a list of computers to install a given printer


#Add Printer
$DriverName= "The Name of the driver"
$HostName="PrinterName"
$Path="C:\Users\User\Desktop\Computers.csv"
$import = Import-Csv $Path

ForEach ($ComputerList in $import)
{
$Computer= $ComputerList.("Name")
Write-Output "$Computer"


Add-PrinterDriver -Name "$DriverName" -ComputerName "$Computer"
Add-PrinterPort -Name "$HostName" -PrinterHostAddress "$HostName" -ComputerName "$Computer" 
Add-Printer -ComputerName "$Computer" -Name "$HostName" -drivername "$DriverName" -port "$HostName"
}
