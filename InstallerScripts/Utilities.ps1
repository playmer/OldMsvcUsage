function DownloadFile
{
    param (
        [string]$url,
        [string]$file
    )

    Write-Host "Downloading: $url"
    Write-Host "  Placing it: $file"

    # When calling into .Net, it has it's own working directory, so make sure to move it here.
    $working_dir = Get-Location
    [System.IO.Directory]::SetCurrentDirectory($working_dir)

    $client = New-Object System.Net.WebClient
    $client.DownloadFile($url, $file);
}

function StartAndWaitForProcess
{
    param (
        [string]$command,
        [string]$arguments
    )

    # When calling into .Net, it has it's own working directory, so make sure to move it here.
    $working_dir = Get-Location
    [System.IO.Directory]::SetCurrentDirectory($working_dir)

    $installinfo = New-object System.Diagnostics.ProcessStartInfo
    $installinfo.FileName = $command
    $installinfo.Arguments = $arguments
    $install = New-Object System.Diagnostics.Process
    $install.StartInfo = $installinfo
    [void]$install.Start()
    $install.WaitForExit()
    return $install.ExitCode
}
