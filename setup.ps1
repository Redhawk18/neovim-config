Remove-Item -Recurse -Force $env:USERPROFILE\.config\nvim -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Value (Get-Location)

