# Ref: https://social.technet.microsoft.com/Forums/en-US/814fed50-2d03-45d0-a44d-0fe14a3a855d/list-all-file-extensions-with-size?forum=winserverpowershell

#$dir = "."
$dir = "C:\Windows"

$count = @{}
$size = @{}
Get-ChildItem $dir -recurse | ForEach-Object{
[int]$count[$_.extension] += 1
[int64]$size[$_.extension] += $_.length
}
$results = @()
$count.keys | ForEach-Object {
$result = ""| Select-Object extension,extensionLength,count,size
$result.extension = $_
$result.extensionLength = $_.lengths
$result.count = $count[$_]
$result.size = $size[$_]
$results += $result
}
$results | Sort-Object -Property extensionLength | Format-Table -auto
$results | export-csv c:\temp\result.csv
