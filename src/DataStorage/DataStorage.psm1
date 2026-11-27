<#
.SYNOPSIS
    Datatype storage for Shellfish lexer/parser

.DESCRIPTION
    A collection of datatypes for storing data from the apreser and lexer
#>

enum TokenType
{
    #commands
    Command
    Flag     # called switch in fish docs, but is "Switch" is keyword in PowerShell

    SingleQuoteString
    DoubleQuoteString
    EscapeChar

    #read/write/append redirection
    Read
    ReadOrNull
    WriteStdOut
    WriteStdErr
    AppendStdOut
    AppendStdErr
    NoClobberWrite 
    Pipe

    #job control
    BackgroundJob

    #functions
    Func  #Fish uses "function", but so does PowerShell

    #conditons
    IfStmt
    ElseStmt
    And
    Or 
    Not 
    SwitchStmt
    CaseStmt

    #loops
    WhileLoop
    ForLoop
    InExpr
    BreakStmt
    ContinueStmt

    #clokcs
    BeginStmt

    #blocks - fucntions, if, loops, etc.
    EndStmt #Fish uses "end", but so does PowerShell

    #variables
    Variable

    #operators
    LeftRoundBracket
    RightRoundBracket
    LeftSquareBracket
    RightSquareBracket
    LeftCurlyBracket
    RightCurlyBracket
    DollarSign
    Comma
    SemiColon
    Asterisk
    DoubleAsterisk
    Slash
    Ampersand
    Tilde
}

class Token 
{
    $Lexeme
    [string]$FileName
    [string]$Line
    [int]$Location
    [TokenType]$Type

     Token($Lexeme, [string]$FileName, [string]$Line, [int]$Location, [TokenType]$Type) {
        $this.Lexeme = $Lexeme
        $this.FileName = $FileName
        $this.Line = $Line
        $this.Location = $Location
        $this.Type = $Type
    }
}