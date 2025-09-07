# Must be in an elevated Prompt

Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All

Invoke-WebRequest https://go.microsoft.com/fwlink/?linkid=57034 -MaximumRedirection 1

$working_dir = Get-Location
$DriveLetter = (Mount-DiskImage -ImagePath "$working_dir\VS2005_Express.iso" -PassThru | Get-Volume).DriveLetter
Write-Host $DriveLetter

$drive_path = "${DriveLetter}:\"
dir $drive_path

# We need to copy the contents of the ISO to a temp folder for the VC installer to use.
$source_folder = "${drive_path}*"
$temp_dir = "${env:TEMP}\IXP000.TMP"
Write-Host $source_folder
Write-Host $temp_dir
mkdir "C:\Users\playmer\AppData\Local\Temp\IXP000.TMP"
Copy-item -Force -Recurse -Verbose "$source_folder" -Destination "$temp_dir"

# Finally run the VC installer, making sure to tell it to use the directory we just copied to
& "${drive_path}ixpvc.exe" /q:a /T:"$temp_dir" /c:"msiexec /i vcsetup.msi VSEXTUI=1 ADDLOCAL=ALL REBOOT=ReallySuppress"

# We should use an API to get back a process to wait for.


# Update our path variable after install so we can use vcvars in this env.
$env:VS80COMNTOOLS=[System.Environment]::GetEnvironmentVariable("VS80COMNTOOLS", "MACHINE")

