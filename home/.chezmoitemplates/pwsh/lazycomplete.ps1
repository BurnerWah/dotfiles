using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName '{{ first (. | splitList " ") }}' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    Register-ArgumentCompleter -Native -CommandName '{{ first (. | splitList " ") }}' -ScriptBlock {}
    Invoke-Expression '{{ . }}' | Out-String | Invoke-Expression
    [System.Management.Automation.CommandCompletion]::CompleteInput($commandAst.ToString().PadRight($cursorPosition, ' ').Substring(0, $cursorPosition), $cursorPosition, $null).CompletionMatches
}
