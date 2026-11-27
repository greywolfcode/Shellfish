<#
.SYNOPSIS
    Function for lexing single quoted strings
#>

function Resolve-SingleQuotes
{
    param (
        [PSCustomObject]$State,
        [string]$Line
    )

    $String = [System.Text.StringBuilder]::new()

    while (($State.Index -le $Line.Length) -and (-not (Test-Next -State $State -Line $Line -Char "'")))
    {
        $Char = Get-Next -State $State -Line $Line
        $null = $String.Append($Char)
    }

    return $String.ToString()
}