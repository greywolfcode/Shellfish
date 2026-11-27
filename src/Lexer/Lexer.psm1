<#
.SYNOPSIS
    Lexer for Fish language
#>

function Get-Tokens 
{
    param (
        [string]$File,
        [string]$FileName
    )
    #create state
    $State = [PSCustomObject]@{
        Index = 0
        File = $File
        Tokens = [System.Collections.Generic.List[Token]]::new()
    }

    $Lines = $File -split "`n"

    foreach ($Line in $Lines)
    {   
        $State.Index = 0 #parsing line by line, so index needs to reset
        while ($State.Index -le $Line.Length)
        {
            $CurrentChar = Get-Next -State $State -Line $Line
            
            switch  -CaseSensitive ($CurrentChar) 
            {
                '#' {$State.Index = $Line.Length}
                '&' {
                    if (Test-Next -State $State -Line $Line -Char '&') 
                    {
                        Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '&&' -Type And
                    } 
                    else 
                    {
                        Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '&' -Type Ampersand
                    }
                }
                '$' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '$' -Type DollarSign
                }
                '(' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '(' -Type LeftRoundBracket
                }
                ')' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme ')' -Type RightRoundBracket
                }
                '[' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '[' -Type LeftSquareBracket
                }
                ']' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme ']' -Type RightSquareBracket
                }
                '{' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '{' -Type LeftCurlyBracket
                }
                '}' {
                    Add-Token -State $State -FileName $FileName -Line $Line -Lexeme '}' -Type RightCurlyBracket
                }
                default {} #TODO Throw Error
            }
        }
    }

    return $State.Tokens
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
function Test-Next
{
    param (
        [PSCustomObject]$State,
        [string]$Line,
        [string]$Char
    )

    if ($Line[($State.Index)] -eq $Char)
    {
        $State.Index += 1
        return $true
    }
    return $false
}
function Add-Token
{
    param (
        [PSCustomObject]$State,
        [string]$FileName,
        [string]$Line,
        [string]$Lexeme,
        [TokenType]$Type
    )
    $Location = $State.Index - $Lexeme.Length
    $Token = [Token]::new($Lexeme, $FileName, $Line, $Location, $Type)

    $State.Tokens.Add($Token)
}