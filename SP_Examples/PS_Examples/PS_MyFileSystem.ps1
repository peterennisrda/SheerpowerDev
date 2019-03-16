# Run the following command first in the console to bypass not digitally signed error
# Ref: http://tritoneco.com/2014/02/21/fix-for-powershell-script-not-digitally-signed/
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$outputfiletxt = "C:\TEMP\My File System Report.txt"
$outputfilecsv = "C:\TEMP\My File System Report.csv"
#$mydir = "C:\Windows"
$mydir = "C:\INSTALL"

# Get-ChildItem          ' alias is gci
# Get-Alias | More       ' show paged list of all aliases
#
# Show all aliases for Get-ChildItem
# Ref: https://stackoverflow.com/questions/6635059/filter-the-output-of-a-command-as-if-it-was-text
# (Get-Alias | Out-String) -split "`r`n" | Select-String Get-ChildItem

# Show all properties of Get-ChildItem
# NOTE: The available properties are not of the cmdlet, but of the objects it produces
# Ref: https://www.vistax64.com/threads/how-do-i-find-the-available-properties-say-of-get-childitem.47251/
# Get-ChildItem | Get-Member

# NOTE: Generally, the closer you can get to limiting the number of objects returned to the pipeline, the faster you code will run
# Ref: https://mcpmag.com/articles/2018/01/16/filtering-command-output-in-powershell.aspx
# Using Filter is 4x faster than Where-Object and 3x faster than where() !!!


#     Select-Object Attributes, BaseName, CreationTime, Directory, DirectoryName, Exists, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, PSStandardMembers, Root, Target, VersionInfo |



#Get-ChildItem -Force $mydir -Recurse |
#    Select-Object Attributes, BaseName, CreationTime, Directory, DirectoryName, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, VersionInfo |
#    Format-Table | Export-Csv $outputfile


# NOTE: Cannot use Format-Table as the output is truncated
##Select-Object Mode, Name, FullName, Extension, Directory, Length, CreationTime |


Get-ChildItem -Force $mydir -Recurse |
    Select-Object Attributes, BaseName, CreationTime, Directory, DirectoryName, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, VersionInfo |
    Sort-Object -Property Length -Descending > $outputfiletxt #|
#Format-Table -AutoSize > $outputfiletxt

Write-Host "Result sent to '$outputfiletxt'"
Read-Host -Prompt "Press Enter to continue"

#Get-ChildItem -Force $mydir -Recurse |
#    Select-Object Mode, Name, FullName, Extension, Directory, Length, CreationTime |
#    Format-Table -AutoSize |
#    Sort-Object -Property Length -Descending |
#    Export-Csv $outputfilecsv -NoTypeInformation
