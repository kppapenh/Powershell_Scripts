# This scripts pushes a URL link to the desktop of a machine stipulated in the $Inputfile

$creds     = Get-Credential
$Inputfile = get-content "C:\Users\$Username\Desktop\machines.txt"      # location of devices to push link to
foreach($computer in $Inputfile){
 If (test-connection -ComputerName $computer -Count 2 -Quiet)           #test to see if computer is online
    {
       

$TargetFile   = "http://www.URLToPush.com\3432\23432\"
$ShortcutFile = "\\$computer\C$\Users\Public\Desktop\NameOfLink.lnk"    #Location to put the shortcut
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut     = $WScriptShell.CreateShortcut($ShortcutFile)             #creates shortcut
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

$status = "Success"
write-output "Computer "$computer": "$status
    }
else                                                                      # Checks and outputs message if it was successful
    {   
        $status = "Unreachable"
        write-output "Computer"$computer": "$status
    }
  }
