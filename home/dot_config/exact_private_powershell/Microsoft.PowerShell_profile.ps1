$Env:PSModulePath = $Env:PSModulePath + (($IsWindows) ? ";" : ":") + (Join-Path $PSScriptRoot "Modules")
if (($Host.Name -eq 'ConsoleHost') `
        -and ([System.Environment]::UserInteractive) `
        -and -not ([System.Environment]::GetCommandLineArgs().Contains('-NonInteractive'))) {
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh | Invoke-Expression
    }

    if (Get-Command carapace -ErrorAction SilentlyContinue) {
        Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
        Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
        carapace _carapace powershell | Out-String | Invoke-Expression
    }

    Import-Module -Name Burner.Zoxide
    Import-Module -Name Burner.TheFuck
}
