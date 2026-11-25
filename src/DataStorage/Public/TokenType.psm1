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
}