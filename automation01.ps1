param(
    [string]$ScadPath = "C:\Users\riccardo\Desktop\supplydrive01\initialsblock.scad"
)

$clientDir = "C:\Users\riccardo\Desktop\supplydrive01\client"
$allItems = Get-ChildItem -Path $clientDir -Recurse -Filter *.txt

foreach ($item in $allItems) {
    [string]$initials_item = (Get-Content $item.FullName).Trim()
    $itemcostumer = $item.BaseName

    # initials
    (Get-Content $ScadPath) -replace 'initials = ".*?";', "initials = `"$initials_item`";" | Set-Content $ScadPath

    Write-Host "Generating STL for $itemcostumer with initials '$initials_item'"

    # scad
    Start-Process -FilePath "openscad" -ArgumentList "-o $itemcostumer.stl $ScadPath" -Wait
}
