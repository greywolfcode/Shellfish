 <#
  .SYNOPSIS
  Fish interpreter written in Powershell

  .DESCRIPTION
  Fish REPL and Fish script interpreter that runs on Powershell. 

  .PARAMETER Help 
  Displays this message and exits

  .PARAMETER License 
  Displays the license and exits
#>
 
 #define parameters
 param (
    [Alias('H')]
    [switch]$Help,

    [Alias('L')]
    [switch]$License
 )

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
 }
 elseif ($License) 
 {
   Write-Output "MIT License"
   Write-Output ""
   Write-Output "Copyright (c) 2026 greywolfcode"
   Write-Output ""
   Write-Output "Permission is hereby granted, free of charge, to any person obtaining a copy"
   Write-Output "of this software and associated documentation files (the `"Software`"), to deal"
   Write-Output "in the Software without restriction, including without limitation the rights"
   Write-Output "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell"
   Write-Output "copies of the Software, and to permit persons to whom the Software is"
   Write-Output "furnished to do so, subject to the following conditions:"
   Write-Output ""
   Write-Output "The above copyright notice and this permission notice shall be included in all"
   Write-Output "copies or substantial portions of the Software."
   Write-Output ""
   Write-Output "THE SOFTWARE IS PROVIDED `"AS IS`", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR"
   Write-Output "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,"
   Write-Output "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE"
   Write-Output "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER"
   Write-Output "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,"
   Write-Output "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE"
   Write-Output "SOFTWARE."
 }