$org_and_repo = "llvm/llvm-project"

$tag = (Invoke-WebRequest "https://api.github.com/repos/${org_and_repo}/releases/latest" | ConvertFrom-Json).tag_name
$version = $tag.Split("-")[1]
Write-Host $version

$file = "clang+llvm-${version}-x86_64-pc-windows-msvc.tar.xz"
$url = "https://github.com/${org_and_repo}/releases/download/${tag}/${file}"

# When calling into .Net, it has it's own working directory, so make sure to move it here.
$working_dir = Get-Location
[System.IO.Directory]::SetCurrentDirectory($working_dir)

# Write-Host $url
# $client = New-Object System.Net.WebClient
# $client.DownloadFile($url, $file);

# This works, but it's really slow, maybe rely on something else?
tar -xvjf $file