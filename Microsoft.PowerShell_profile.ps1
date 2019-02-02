<#
Powershell Profile
KET
02\02\2019
#>

Set-Location C:\PS1

#Powershell Logging

Start-Transcript C:\PS1\PSLogs\log$YYYYMMDD.txt -Append
function Close-Powershell { if ($Error.Count -gt 0) { $Error | Out-File c:\PS1\PSLogs\errors$YYYYMMDD.txt -Append } Stop-Transcript exit
}
#UI Modification
$host.ui.RawUI.WindowTitle = "($env:userdomain\$env:username) Windows PowerShell"

#Alias items
new-item alias:np -value C:\Windows\System32\notepad.exe
new-item alias:npp -value "C:\Program Files (x86)\Notepad++\notepad++.exe"

