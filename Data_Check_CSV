$Path="C:\Users\$User\Downloads\ipads.csv"
$import = Import-Csv $Path
$arrays=@()
foreach ($Attribute In $import)
{
	$Name = $Attribute.("name")
	$SN = $Attribute.("serial number")
	$Product = $Attribute.("product name")
	$OS = $Attribute.("os version")
	$Supervised = $Attribute.("supervised")
	$LastIP = $Attribute.("last ip")
	$LastCheckin = $Attribute.("Last checkin")
	$LastCheckin = $LastCheckin.Substring(0, $LastCheckin.LastIndexof(' '))
	$Check = "9/25/2017"


	if ($LastCheckin -ne $Check)
	{
		$array= New-Object PSObject
		
		$array| Add-Member -MemberType NoteProperty -Name "name" -Value $Name
		$array| Add-Member -MemberType NoteProperty -Name "product name" -Value $Product
		$array| Add-Member -MemberType NoteProperty -Name "os version" -Value $OS
		$array| Add-Member -MemberType NoteProperty -Name "supervised" -Value $Supervised
		$array| Add-Member -MemberType NoteProperty -Name "last ip" -Value $LastIP
		$array| Add-Member -MemberType NoteProperty -Name "serial number" -Value $SN
		$array| Add-Member -MemberType NoteProperty -Name "Last checkin" -Value $LastCheckin
		
		$arrays+=$array
		
		$arrays|Export-Csv -NoTypeInformation -path "C:\Users\k_papenhausen\Downloads\Missing_Check_In_iPads.csv"

		
		write-output $LastCheckin

	}
}
