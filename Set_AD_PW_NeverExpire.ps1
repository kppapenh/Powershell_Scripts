#Sets all users from a specific OU path password to never expire



Import-Module ActiveDirectory

$User=Get-ADUser -filter * -SearchBase "$OU" -properties samaccountname| Select-Object samaccountname | export-csv "C:\Users\$User\Desktop\users.csv" 
$OU= "OU=Domain,DC=path,DC=org"  #change the OU path to set where to set passwords to never expire

$Path1="C:\Users\$User\Desktop\users.csv"
$import1 = Import-Csv $Path1


foreach($Users in $import1)
{

	$ID=$Users.("samaccountname")
	$User=Get-ADUser -server "Domain.org" -SearchBase "$OU" -LDAPFilter "(samaccountname=$ID)" -properties pwdlastset

	if ($User.pwdlastset -eq "0")
	{
		Write-output $ID"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!password has not been set"
	}

	else 
	{
		Write-output "setting to never expire"
		Set-ADUser $User -PasswordNeverExpires $True
		
	}
  
}
