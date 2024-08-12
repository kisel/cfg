# pretend it's a bash shell
# this was a bad idea. installing real commands instead
#
# scoop install busybox

# Set-Alias grep Select-String
# Set-Alias open Invoke-Item
# Set-Alias less more
Set-Alias time Measure-Command
Set-Alias which Get-Command

#Function head($fn) {
#        Get-Content -Path $fn -ReadCount 32 | Format-List | more
#}

# common powershell scripts

# Prints time took to run last command
function time-last {
    $cmd = (Get-History -Count 1)
    $dur = $cmd.Duration
    $totalSec = [math]::floor($dur.TotalSeconds)
    $ms = [math]::floor($dur.Milliseconds)
    Write-Output "rc=$LastExitCode | took $totalSec seconds $ms ms"
}

# watch { echo HI }
function watch() { 
  $interval = 3
  If ($args.Length -gt 1) {
      $interval = $args[0]
  }
  while(1) {
    cls
    Invoke-Command $args[-1]
    Sleep $interval
  }
}


# tail -f <filename>
# function tail() {
#     Get-Content -Wait $args[-1]
# }

function ts() {
    ForEach-Object { Get-Date -Format "yyyy-MM-dd HH:mm:ss" } ; $_
}

