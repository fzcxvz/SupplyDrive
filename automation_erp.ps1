param(
    [string]$ScadPath = "C:\Users\riccardo\Desktop\supplydrive01\bike_initials.scad"
)

$clientDir = "C:\Temp\SupplyDrive"
$allItems = Get-ChildItem -Path $clientDir -Filter *.xml

foreach ($item in $allItems) {
    $fileNameParts = $item.BaseName -split "-"
    if ($fileNameParts.Length -eq 3) {
        $orderId = $fileNameParts[0]
        $initials = $fileNameParts[2]

       
        (Get-Content $ScadPath) -replace 'initials = ".*?";', "initials = `"$initials`";" | Set-Content $ScadPath

        $outputFileName = "$orderId-$initials.stl"
        Write-Host "Generating STL for OrderID '$orderId' with initials '$initials' -> $outputFileName"

       
        Start-Process -FilePath "openscad" -ArgumentList "-o $outputFileName $ScadPath" -Wait
    } else {
        Write-Warning "Filename format not recognized: $($item.Name)"
    }
}
