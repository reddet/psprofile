<#
Powershell Profile
KET
02\02\2019
#>

Set-Location C:\PS1

#Powershell Logging
Start-Transcript C:\PS1\PSLogs\log$(get-date -format 'MMddyyyy').log -Append


#UI Modification
$host.ui.RawUI.WindowTitle = "($env:userdomain\$env:username) Windows PowerShell"

#Alias items
new-item alias:np -value C:\Windows\System32\notepad.exe
new-item alias:npp -value "C:\Program Files (x86)\Notepad++\notepad++.exe"

#Functions
function New-Password {C:\PS1\PSScripts\ComplexPassword.ps1}
