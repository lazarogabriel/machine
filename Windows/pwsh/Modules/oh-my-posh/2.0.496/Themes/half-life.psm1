#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    $prompt+= Write-Prompt -Object $sl.CurrentUser -ForegroundColor $sl.Colors.Magenta # username
    $prompt += Write-Prompt -Object (' '+$sl.PromptSymbols.PromptIndicator+' ')  -ForegroundColor  $sl.Colors.Gray # in  
    $prompt += Write-Prompt -Object ($sl.PromptSymbols.HomeSymbol + $pwd.ToString().Replace($HOME, '')) -ForegroundColor $sl.Colors.Green # path

    $status = Get-VCSStatus
    if ($status) {
        $prompt += Write-Prompt -Object " on " -ForegroundColor $sl.Colors.Gray # on 
        $prompt += Write-Prompt -Object $status.Branch -ForegroundColor $sl.Colors.Cyan # branch
        if ($status.Working.Length -gt 0) {
            $prompt += Write-Prompt -Object (" " + $sl.PromptSymbols.GitDirtySymbol) -ForegroundColor $sl.Colors.Red # git dirty symbol
        } 
    }

    $prompt += Write-Prompt -Object (' ' + $sl.PromptSymbols.StartCommandSymbol + ' ') -ForegroundColor $sl.Colors.Red # commands separator symbol
    $prompt
}


$sl = $global:ThemeSettings #local settings

# Symbols
$sl.PromptSymbols.PromptIndicator = 'in'
$sl.PromptSymbols.HomeSymbol = '~'
$sl.PromptSymbols.StartCommandSymbol = [char]::ConvertFromUtf32(0x000003BB)
$sl.PromptSymbols.GitDirtySymbol = [char]::ConvertFromUtf32(0x000025CF)

# Colors
$sl.Colors.DarkGreen = [ConsoleColor]::DarkGreen 
$sl.Colors.DarkMagenta = [ConsoleColor]::DarkMagenta 
$sl.Colors.DarkCyan = [ConsoleColor]::DarkCyan 
$sl.Colors.DarkGray = [ConsoleColor]::DarkGray 
$sl.Colors.DarkGreen = [ConsoleColor]::DarkGreen
$sl.Colors.DarkBlue = [ConsoleColor]::DarkBlue
$sl.Colors.Cyan = [ConsoleColor]::Cyan 
$sl.Colors.Green = [ConsoleColor]::Green
$sl.Colors.Red = [ConsoleColor]::Red 
$sl.Colors.Magenta = [ConsoleColor]::Magenta
$sl.Colors.Yellow = [ConsoleColor]::Yellow
$sl.Colors.White = [ConsoleColor]::White