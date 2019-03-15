# Ref: https://social.technet.microsoft.com/Forums/en-US/814fed50-2d03-45d0-a44d-0fe14a3a855d/list-all-file-extensions-with-size?forum=winserverpowershell

#$dir = "."
$dir = "C:\Windows"

$count = @{}
$size = @{}
gci $dir -recurse |%{
[int]$count[$_.extension] += 1
[int64]$size[$_.extension] += $_.length
}
$results = @()
$count.keys |% {
$result = ""|select extension,extensionLength,count,size
$result.extension = $_
$result.extensionLength = $_.length
$result.count = $count[$_]
$result.size = $size[$_]
$results += $result
}
$results | sort -Property extensionLength | ft -auto
$results | export-csv c:\temp\result.csv
