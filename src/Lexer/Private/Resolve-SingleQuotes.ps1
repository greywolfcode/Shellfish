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

        if ($Char -eq '\')
        {
            if (Test-Next -State $State -Line $Line -Char "'")
            {
                $null = $String.Append("'")
            }
            elseif (Test-Next -State $State -Line $Line -Char "\") #needs to be seperate from else calsue so the index is incremented
            {
                $null = $String.Append("\")
            }
            else 
            {
                $null = $String.Append("\")
            }
        }
        else 
        {
            $null = $String.Append($Char)
        }
    }

    return $String.ToString()
}