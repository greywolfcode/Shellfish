<#
.SYNOPSIS
    Lexer for Fish language
#>

function Get-Tokens 
{
    param (
        [string]$File
    )
    #create state
    $State = [PSCustomObject]@{
        Index = 0
        File = $File
    }

    $Lines = $File -split "`n"

    foreach ($Line in $Lines)
    {   while ($State.Index -le $Line.Length)
        {
            $CurrentChar = Get-Next -State $State -Line $Line
            
            switch  -CaseSensitive ($CurrentChar) 
            {
                default {} #TODO Throw Error
            }
        }
    }
}

function Get-Next
{
    param (
        [PSCustomObject]$State,
        [string]$Line
    )

    $State.Index += 1
    return $Line[($State.Index - 1)]
}