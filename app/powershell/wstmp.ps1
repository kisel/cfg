

function wstmp($name="tmp") {
    $wstmp_base=$tmp ?? $env:TEMP
    $timestamp = (Get-Date -UFormat %s)
    $directoryPath = Join-Path $wstmp_base -ChildPath ("${name}_$($timestamp)")
    mkdir -p $directoryPath
    cd $directoryPath
}

function wstmp-delete() {
    $wstmp_base=$tmp ?? $env:TEMP
    $currentDirFullPath = [System.IO.Path]::GetFullPath($PWD)
    $tempDirFullPath = [System.IO.Path]::GetFullPath($wstmp_base)

    if ($currentDirFullPath.StartsWith($tempDirFullPath) &&
        $currentDirFullPath -ne $tempDirFullPath) {
        cd ..
        rm -rf $currentDirFullPath
        Write-Host "Removed $currentDirFullPath"
    } else {
        Write-Host "The current directory is not in the temporary directory."
    }
}

