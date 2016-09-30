# Default Profile Directory:
# $Env:USERPROFILE\Documents\WindowsPowerShell

function BypassPowerShell
{
   powershell.exe -ExecutionPolicy Bypass $args;
}

Set-Alias ps1 BypassPowerShell;
