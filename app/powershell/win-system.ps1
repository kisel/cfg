
# from admin pwsh
Function defender-disable {
	Set-MpPreference -DisableRealtimeMonitoring $true
}

# from admin pwsh
Function defender-enable {
	Set-MpPreference -DisableRealtimeMonitoring $false
}

$HISTFILE =  "$env:APPDATA/Microsoft/Windows/PowerShell/PSReadLine/ConsoleHost_history.txt"
$HOSTS =  "c:\Windows\System32\Drivers\etc\hosts"

