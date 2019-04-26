# Ref: http://social.technet.microsoft.com/Forums/windowsserver/en-US/1fd035f3-a170-4721-a6b5-d4809ca2e39d/getting-list-of-installed-software-that-matches-control-panels-addremove-programs-or-programs

cls

cd C:\ae

$comp=$args[0]
    
if (($comp -eq "/?") -or ($comp -eq "-h"))  
    {
    (Get-Content C:\$env:HOMEPATH\get-prog-help.txt) | Write-Host
    }  
else  
    { 
    if ($comp -lt 1)
        {
        Write-Host -fore Green "=======Uninstall regkey======="
        get-itemproperty 'hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' | where-object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion, Publisher | Sort DisplayName | format-table -autosize 
        Write-Host -fore Green "=======Wow6432Node Uninstall regkey======="
        get-itemproperty 'hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | where-object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion, Publisher | Sort DisplayName | format-table -autosize
        }  
    else
        {
        $computername = $comp
        $code = { get-itemproperty 'hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' | where-object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion, Publisher | Sort DisplayName | format-table -autosize
        get-itemproperty 'hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | where-object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion, Publisher | Sort DisplayName | format-table -autosize }
        invoke-command -ComputerName $computername -ScriptBlock $code
        } 
    }
 pause