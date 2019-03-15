# Run the following command first in the console to bypass not digitally signed error
# Ref: http://tritoneco.com/2014/02/21/fix-for-powershell-script-not-digitally-signed/
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$outputfile = "C:\TEMP\My File System Report.csv"
$mydir = "."

# Get-ChildItem          ' alias is gci
# Get-Alias | More       ' show paged list of all aliases
#
# Show all aliases for Get-ChildItem
# Ref: https://stackoverflow.com/questions/6635059/filter-the-output-of-a-command-as-if-it-was-text
# (Get-Alias | Out-String) -split "`r`n" | Select-String Get-ChildItem

gci -Force $mydir -Recurse | select Mode,Name,FullName,Directory,Length,CreationTime | Format-Table
