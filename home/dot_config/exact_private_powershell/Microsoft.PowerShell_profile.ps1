$Env:PSModulePath = $Env:PSModulePath + (($IsWindows) ? ";" : ":") + (Join-Path $PSScriptRoot "Modules")
if (($Host.Name -eq 'ConsoleHost') `
        -and ([System.Environment]::UserInteractive) `
        -and -not ([System.Environment]::GetCommandLineArgs().Contains('-NonInteractive')) `
        -and -not ([System.Environment]::GetCommandLineArgs().Contains('-Command'))) {
    # Should be an interactive session

    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh --config jandedobbeleer | Invoke-Expression
    }

    Import-Module -Name Burner.LazyComplete
    Import-Module -Name Burner.Zoxide
    Import-Module -Name Burner.TheFuck

    if (Get-Command carapace -ErrorAction SilentlyContinue) {
        Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
        Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
        carapace _carapace powershell | Out-String | Invoke-Expression
    }
}
