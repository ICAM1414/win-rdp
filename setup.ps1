Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Chrome Remote Desktop Host (silent)
$P = Join-Path $env:TEMP 'chromeremotedesktophost.msi'
Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P
Start-Process msiexec.exe -ArgumentList "/i `"$P`" /qn /norestart" -Wait
Remove-Item $P

# Chrome (silent)
$P = Join-Path $env:TEMP 'chrome_installer.exe'
Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P
Start-Process -FilePath $P -ArgumentList '/silent /install' -Wait
Remove-Item $P
