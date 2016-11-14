function global:prompt
{
    $regex   = [regex]::Escape($Env:USERPROFILE) + "(\\.*)*$";
    $curpath = $executionContext.SessionState.Path.CurrentLocation.Path;
    $relpath = $($curpath -replace $regex, '~$1');
    $prompt  = $('PS>' * ($nestedPromptLevel + 1));

    Write-Host -ForegroundColor Green -nonewline $Env:USERNAME" "
    Write-Host -ForegroundColor Blue             $relpath
    Write-Host -ForegroundColor White -nonewline $prompt

    return " ";
}

function BypassPowerShell
{
    powershell.exe -ExecutionPolicy Bypass $args;
}

function IsAdmin
{
    $user   = [Security.Principal.WindowsIdentity]::GetCurrent();
    $admin  = [Security.Principal.WindowsBuiltInRole]::Administrator;
    $result = ([Security.Principal.WindowsPrincipal]$user).IsInRole($admin);

    return [bool]$result;
}

function SymLink
{
    Param(
        [String]$src  = "",
        [String]$dest = $PWD.Path
    )

    if (-Not (IsAdmin))
    {
        Write-Output "Need admin permissions to make symlinks";
        return;
    }

    # Setup absolute paths of the source and destination files/folders
    $src = $(Get-Item -Path $src.trim()).FullName;
    $dest = $dest.trim();
    $dest_d = $(Get-Item -Path $(Split-Path $dest -parent)).FullName;
    $dest_f = $(Split-Path $dest -leaf);
    $flag = "";

    # Setup the directory flag
    if (Test-Path $src -pathType container)
    {
        $flag = "/D";
    }

    # Make the symlink
    cmd /c mklink $flag "$dest_d\$dest_f" $src;
}

function SetTerminalColors
{
    [console]::ForegroundColor = "White";
    [console]::BackgroundColor = "Black";
}


# Begin Configuration
SetTerminalColors;

Set-Alias ps1 BypassPowerShell;
Set-Alias syml SymLink;

# Chocolatey profile
if (Test-Path($env:ChocolateyInstall))
{
    $ChocolateyProfile =
        "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1";

    if (Test-Path($ChocolateyProfile))
    {
        Import-Module "$ChocolateyProfile";
    }
}

