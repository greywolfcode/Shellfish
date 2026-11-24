 <#
  .SYNOPSIS
  Fish interpreter written in Powershell

  .DESCRIPTION
  Fish REPL and Fish script interpreter that runs on Powershell. 

  .PARAMETER Help 
  Displays this message and exits
#>
 
 #define parameters
 param (
    [Alias('H')]
    [switch]$Help
 )

 if ($help)
 {
   Write-Output "NAME"
   Write-Output "    $PSCommandPath"

   Write-Output "SYNOPSIS"
   Write-Output "    Fish interpreter written in Powershell"

   Write-Output "DESCRIPTION"
   Write-Output "    Fish REPL and Fish script interpreter that runs on Powershell"

   Write-Output "PARAMETERS"
   Write-Output "    -Help, --H"
   Write-Output "        Displays this message and exits"
 }