using module src\DataStorage\Public\TokenType.psm1

class Token 
{
    [string]$Lexeme
    [string]$FileName
    [string]$Line
    [int]$Location
    [TokenType]$Type

     Token([string]$Lexeme, [string]$FileName, [string]$Line, [int]$Location, [TokenType]$Type) {
        $this.Lexeme = $Lexeme
        $this.FileName = $FileName
        $this.Line = $Line
        $this.Location = $Location
        $this.Type = $Type
    }
}