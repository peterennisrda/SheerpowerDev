# Run the following command first in the console to bypass not digitally signed error
# Ref: http://tritoneco.com/2014/02/21/fix-for-powershell-script-not-digitally-signed/
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$outputfiletxt = "C:\TEMP\My File System Report.txt"
$outputfilecsv = "C:\TEMP\My File System Report.csv"
$mydir = "C:\Windows"
#$mydir = "C:\INSTALL"
#$mydir = "C:\SARA.github"

if (Test-Path $dir) {
    #throw $dir + " exists."
}
else {
    # Exit if $dir does NOT exist
    throw $dir + " does NOT exist."
    Exit
}

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

# ALL properties for Get-ChildItem
# TEST 1
# Attributes, BaseName, CreationTime, Directory, DirectoryName, Exists, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, PSStandardMembers, Root, Target, VersionInfo |
# RESULTS: Latitude E6430 : My File System Report.txt -> 555,569 KB : My File System Report.csv -> 181,384 KB
# TEST 2 - Do not extport VersionInfo
# Attributes, BaseName, CreationTime, Directory, DirectoryName, Exists, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, PSStandardMembers, Root, Target |


# NOTE: Cannot use Format-Table as the output will be truncated


Get-ChildItem -Force $mydir -Recurse |
    Select-Object Attributes, BaseName, CreationTime, Directory, DirectoryName, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, VersionInfo |
    Sort-Object -Property Length -Descending > $outputfiletxt

#Write-Host "Result sent to '$outputfiletxt'"
#Read-Host -Prompt "Press Enter to continue"

Get-ChildItem -Force $mydir -Recurse |
    Select-Object Attributes, BaseName, CreationTime, Directory, DirectoryName, Extension, FullName, IsReadOnly, LastAccessTime, Length, LinkType, Mode, Name, Parent, VersionInfo |
    Sort-Object -Property Length -Descending |
    Export-Csv $outputfilecsv -NoTypeInformation
