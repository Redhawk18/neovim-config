Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Value (Get-Location)

