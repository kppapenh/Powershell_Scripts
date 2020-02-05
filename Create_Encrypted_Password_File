//Prompts for a password and then creates an encrypted password file to be used in scripts for secure authentication

$SecurePassword = Read-Host -AsSecureString  "Enter password" | convertfrom-securestring | out-file C:\Users\$User\Desktop\Password.csv
