# This is adapted from the script dotnet-suggest generates, since that script
# applies completions to programs that don't actually work with dotnet-suggest.
# It'll probably need updates as time passes.
if (Get-Command 'dotnet-suggest' -ErrorAction SilentlyContinue) {
    $Script:DotnetSuggestCommands = @('dotnet-suggest', 'vpm')

    Register-ArgumentCompleter -Native -CommandName $Script:DotnetSuggestCommands -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)
        $fullpath = (Get-Command $commandAst.GetCommandName()).Source
        $arguments = $commandAst.Extent.ToString().Replace('"', '\"')

        dotnet-suggest get -e $fullpath --position $cursorPosition -- "$arguments" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    }
}
