﻿$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

$version=(cat version/version)

New-Item -ItemType Directory -Path "$PWD\built-metadata" -Force

docker run `
  -w c:\built-metadata`
  --rm `
  "cloudfoundry/windows2016fs:$version" `
  "powershell" "-Command" "Get-Hotfix | Select HotFixID,InstalledOn,Description,InstalledBy > kb-metadata"
# if ($LASTEXITCODE -ne 0) {
#   throw "failed to build metadata"
# }

Write-Output "cloudfoundry/windows2016fs:$version"
Get-Content "$PWD\built-metadata\kb-metadata"
