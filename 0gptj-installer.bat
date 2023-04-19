winget install -e --id Microsoft.WindowsTerminal
set current_dir=%cd%
start wt -d %current_dir% powershell.exe -File "%current_dir%\1gptj-installer.ps1"