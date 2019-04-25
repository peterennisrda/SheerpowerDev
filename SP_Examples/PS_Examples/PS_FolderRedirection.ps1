


Write-Host "The current logged in user:"
Write-Host '$ENV:UserName =' $ENV:UserName
Write-Host

Exit

# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /d "\\misdc01\FolderRedirections\%USERNAME%\Desktop" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /d "\\misdc01\FolderRedirections\%USERNAME%\My Videos" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /d "\\misdc01\FolderRedirections\%USERNAME%\My Music" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /d "\\misdc01\FolderRedirections\%USERNAME%\My Pictures" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /d "\\misdc01\FolderRedirections\%USERNAME%\My Pictures" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /d "\\misdc01\FolderRedirections\%USERNAME%" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /d "\\misdc01\FolderRedirections\%USERNAME%\Desktop" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /d "\\misdc01\FolderRedirections\%USERNAME%\My Videos" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /d "\\misdc01\FolderRedirections\%USERNAME%\My Music" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /d "\\misdc01\FolderRedirections\%USERNAME%\My Pictures" /f
# reg add "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /d "\\misdc01\FolderRedirections\%USERNAME%\My Pictures" /f

 