#!/usr/bin/env pwsh
param(
    [string]$SourceDir = "./src",
    [string]$OutputFile = "lib-pure-math.txt"
)

if (Test-Path -Path $OutputFile -PathType Leaf) {
    Remove-Item -Path $OutputFile -Force
}

Get-ChildItem -Path $SourceDir -File -Recurse | ForEach-Object {
    $file = $_.FullName
    $extension = $_.Extension
    $nn = if ($extension -eq '.txt') { $_.BaseName } else { $_.Name }

    Get-Content -Path $file -Encoding UTF8 | ForEach-Object {
        $_ + '$' + $nn
    } | Add-Content -Path $OutputFile -Encoding UTF8
}