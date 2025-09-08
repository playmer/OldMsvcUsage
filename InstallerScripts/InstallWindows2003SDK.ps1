# Must be in an elevated Prompt

Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All

Invoke-WebRequest https://download.microsoft.com/download/7/5/e/75ec7f04-4c8c-4f38-b582-966e76602643/5.2.3790.1830.15.PlatformSDK_Svr2003SP1_rtm.img -MaximumRedirection 1

$working_dir = Get-Location
$DriveLetter = (Mount-DiskImage -ImagePath "$working_dir\5.2.3790.1830.15.PlatformSDK_Svr2003SP1_rtm.img" -PassThru | Get-Volume).DriveLetter
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
& "${drive_path}Setup\PSDK-amd64.msi" /qb

# We should use an API to get back a process to wait for.

