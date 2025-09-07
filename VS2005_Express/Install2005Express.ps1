# Must be in an elevated Prompt

# Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All

# Invoke-WebRequest https://go.microsoft.com/fwlink/?linkid=57034 -MaximumRedirection 1


$working_dir = Get-Location
$DriveLetter = (Mount-DiskImage -ImagePath "$working_dir\VS2005_Express.iso" -PassThru | Get-Volume).DriveLetter
Write-Host $DriveLetter

$drive_path = "${DriveLetter}:\"
dir $drive_path

# $temp_dir = "${env:TEMP}\IXP000.TMP"



$source_folder = "${drive_path}*"
$temp_dir = "${env:TEMP}\IXP000.TMP"
Write-Host $source_folder
Write-Host $temp_dir
mkdir "C:\Users\playmer\AppData\Local\Temp\IXP000.TMP"
Copy-item -Force -Recurse -Verbose "$source_folder" -Destination "$temp_dir"

& "${drive_path}ixpvc.exe" /q:a /T:"$temp_dir" /c:"msiexec /i vcsetup.msi VSEXTUI=1 ADDLOCAL=ALL REBOOT=ReallySuppress"