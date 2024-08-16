if (($Host.Name -eq 'ConsoleHost') -and ([System.Environment]::UserInteractive) -and -not ([Environment]::GetCommandLineArgs().Contains('-NonInteractive'))) {
    # Should be an interactive session

    $Script:ProfileDir = Split-Path -Path $PROFILE -Parent

    oh-my-posh init pwsh --config (Join-Path $env:POSH_THEMES_PATH "jandedobbeleer.omp.json") | Invoke-Expression # DevSkim: ignore DS104456

    Import-Module -Name scoop-completion
    Import-Module -Name Burner.Completions # Custom module I put all my completions into
    Import-Module -Name Burner.Generated # Custom module I put all my generated scripts into

    Set-Alias -Name ll      -Value Get-ChildItem
    Set-Alias -Name which   -Value Get-Command
    Set-Alias -Name whereis -Value Get-Command

    # Autocompletion
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
    Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
    carapace _carapace | Out-String | Invoke-Expression # DevSkim: ignore DS104456
}



#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

