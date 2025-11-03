. "$PSScriptRoot/Utilities.ps1"

# Must be in an elevated Prompt

# $file = "DXSDK_Jun10.exe"
# $url = "https://download.microsoft.com/download/a/e/7/ae743f1f-632b-4809-87a9-aa1bb3458e31/${file}"

# DownloadFile $url $file

# Finally run the VC installer, making sure to tell it to use the directory we just copied to
StartAndWaitForProcess "DXSDK_Jun10.exe" "/U /F"

# We should use an API to get back a process to wait for.

