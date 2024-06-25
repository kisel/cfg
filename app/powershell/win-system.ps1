
# from admin pwsh
Function defender-disable {
	Set-MpPreference -DisableRealtimeMonitoring $true
}

# from admin pwsh
Function defender-enable {
	Set-MpPreference -DisableRealtimeMonitoring $false
}
