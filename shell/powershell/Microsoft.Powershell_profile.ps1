# Default Profile Directory:
# $Env:USERPROFILE\Documents\WindowsPowerShell

function BypassPowerShell
{
    powershell.exe -ExecutionPolicy Bypass $args;
}

function IsAdmin
{
    # Check current window privileges
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $admin = [Security.Principal.WindowsBuiltInRole]::Administrator;
    # $admin_SID = "S-1-5-32-544";
    $result = ([Security.Principal.WindowsPrincipal]$user
                ).IsInRole($admin);

    # compare SID of user to an admin's SID
    # $result = $user.groups -match $admin_SID;

    return [bool]$result;
}

function SymLink
{
    Param(
        [String]$src="",
        [String]$dest=(Get-Item -Path ".\").FullName   # $(pwd)
    )

    # Setup absolute paths of the source and destination files/folders
    $src = $(Get-Item -Path $src.trim()).FullName;
    $dest = $dest.trim();
    $dest_d = $(Get-Item -Path $(Split-Path $dest -parent)).FullName;
    $dest_f = $(Split-Path $dest -leaf);

    # Setup the directory flag
    if (Test-Path $src -pathType container) {
        $dir_flag="/D";
    } else {
        $dir_flag="";
    }

    # Make the symlink
    cmd /c mklink $dir_flag "$dest_d\$dest_f" $src;
}

Set-Alias ps1 BypassPowerShell;
Set-Alias syml SymLink;
