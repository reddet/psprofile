<#
Powershell Profile
KET
03\17\2019
#>

<#
	.WHOIS
	Keith Tedder
	
	.NOTES
		Added Function New-Password (Password Generator)
		Added Function Test-PasswordComplexity
	
	.SYNOPSIS
		Powershell Profile
		
	.DESCRIPTION
	
	.EXAMPLE
	
	.LINK
		
#>


################################################################################
# Custom PS Location
Set-Location C:\PS1

################################################################################
#Custom PS Color Scheme (WIP)
#[console]::BackgroundColor = "black"
#
################################################################################
# Script Directory
$psdir="${env:tools}"


################################################################################
# 'autoload' Scripts
get-childitem "$psdir\autoload\*.ps1" | %{.$_}


################################################################################
#Console Customizations
$host.ui.RawUI.WindowTitle = "($env:userdomain\Bifrost) Windows PowerShell" 

Function Prompt
{
    $promptString = "PS " + $(Get-Location) + ">"
    Write-Host $promptString -NoNewline -ForegroundColor Yellow
    return " "
}

################################################################################
# Begin Functions



# Password Generator ###########################################################
Function New-Password {
    param(
        [int] $Length = 16,
        [string[]]$ASCII = ('48-57','65-90','97-122','33','45','46','63')
    )
    $pwd = ''

    $Ascii_codes = $Null 
    $ASCII | %{ $Ascii_codes += Invoke-expression $_.replace('-','..') }
    $chars = @() 
    $Ascii_codes | %{ $chars += [char][byte] $_ }

    1..$Length | %{
        $pwd += $chars | Get-Random
    }

    if (-not $(Test-PasswordComplexity -Password $pwd)) {
        $pwd = New-Password -Length $Length -ASCII $ASCII
    }
	set-clipboard -Value $pwd
    Write-Output $pwd
}



Function Test-PasswordComplexity {
    param(
        [string]$Password
    )

    $isGood = 0
    # Check for special chars
    if ($Password -match '[^a-zA-Z0-9]') { $isGood++ }
    if ($Password -match '[0-9]') { $isGood++ }
    if ($Password -cmatch '[a-z]') { $isGood++ }
    if ($Password -cmatch '[A-Z]') { $isGood++ }
    if ($isGood -ge 3) { Write-Output $true }
    else { Write-Output $false }
}

	
	


# Password Generator END########################################################
# End Functions
################################################################################
# Alias
new-item alias:np -value C:\Windows\System32\notepad.exe

Write-Host "The Skybridge Awaits Your Command" -foregroundcolor green


################################################################################
