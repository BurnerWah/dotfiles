using namespace System.Management.Automation
using namespace System.Management.Automation.Language

$Script:Completers = (Get-Content (Join-Path $PSScriptRoot "generated.json") | ConvertFrom-Json -AsHashtable)
$Script:LazyComplete = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $commandName = $commandAst.GetCommandName()
    Register-ArgumentCompleter -Native -CommandName $commandName -ScriptBlock {}
    Invoke-Expression $Script:Completers[$commandName] | Out-String | Invoke-Expression
    [System.Management.Automation.CommandCompletion]::CompleteInput( `
            $commandAst.ToString().PadRight($cursorPosition, ' ').Substring(0, $cursorPosition), `
            $cursorPosition, `
            $null `
    ).CompletionMatches
}
$Script:Completers.Keys | ForEach-Object {
    Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock $Script:LazyComplete
}
