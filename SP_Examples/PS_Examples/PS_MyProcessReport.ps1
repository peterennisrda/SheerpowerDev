
# Run the following command first in the console to bypass not digitally signed error
# Ref: http://tritoneco.com/2014/02/21/fix-for-powershell-script-not-digitally-signed/
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$outputfile = "C:\TEMP\My Process Report"

# Ref: https://www.petri.com/powershell-problem-solver-getting-process-details
# Output non system running processes with time

get-process | where {$_.company -notmatch 'microsoft' -AND $_.path} | Sort StartTime -Descending | Select ID,Name,Path,
StartTime,@{Name="RunTime";Expression={(Get-Date) - $_.StartTime}},
WS,VM,Company > $outputfile

Write-Host "Result sent to '$outputfile'"
Read-Host -Prompt "Press Enter to continue"
