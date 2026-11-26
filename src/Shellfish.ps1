<#
.SYNOPSIS
Fish interpreter written in Powershell

.DESCRIPTION
Fish REPL and Fish script interpreter that runs on Powershell. 

.PARAMETER Help 
Displays this message and exits

.PARAMETER License 
Displays the license and exits

.PARAMETER InputPath 
Path to your Fish shell script
#>

[CmdletBinding(PositionalBinding=$false)]
#define parameters
param (
  [Alias('H')]
  [switch]$Help,
  [Alias('L')]
  [switch]$License,
  [string]$InputPath
  )

Import-Module -Name "$PSScriptRoot\Lexer\Lexer.psd1"

if ($Help)
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
  Write-Output "    -License, --L"
  Write-Output "        Displays the license and exits"
  Write-Output "    InputPath"
  Write-Output "        Path to your Fish shell script"
}
elseif ($License) 
{
  Write-Output "Shellfish Fish interpreter written in Powershell"
  Write-Output "Copyright (C) 2026  greywolfcode"
  Write-Output ""
  Write-Output "This program is free software; you can redistribute it and/or modify"
  Write-Output "it under the terms of the GNU General Public License version 2"
  Write-Output "as published by the Free Software Foundation."
  Write-Output ""
  Write-Output "This program is distributed in the hope that it will be useful,"
  Write-Output "but WITHOUT ANY WARRANTY; without even the implied warranty of"
  Write-Output "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
  Write-Output "GNU General Public License for more details."
  Write-Output ""
  Write-Output "You should have received a copy of the GNU General Public License along"
  Write-Output "with this program; if not, write to the Free Software Foundation, Inc.,"
  Write-Output "51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA."
}
# Run input file
elseif ($InputPath -ne "")
{

}
# Run REPL
else 
{
  while ($true)
  {
    $Code = Read-Host "> "
    $Tokens = Get-Tokens -File $Code -FileName ""
    Write-Output $Tokens
  }
}