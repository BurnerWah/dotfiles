$Env:PSModulePath = $Env:PSModulePath + (($IsWindows) ? ";" : ":") + (Join-Path $PSScriptRoot "Modules")
if (($Host.Name -eq 'ConsoleHost') `
        -and ([System.Environment]::UserInteractive) `
        -and -not ([System.Environment]::GetCommandLineArgs().Contains('-NonInteractive'))) {
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh | Invoke-Expression
    }

    if (Get-Command zoxide -ErrorAction SilentlyContinue) {
        Invoke-Expression (& { (zoxide init powershell | Out-String) })
    }

    if (Get-Command carapace -ErrorAction SilentlyContinue) {
        Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
        Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
        carapace _carapace powershell | Out-String | Invoke-Expression
    }

    if (Get-Command thefuck -ErrorAction SilentlyContinue) {
        function fuck {
            $history = (Get-History -Count 1).CommandLine;
            if (-not [string]::IsNullOrWhiteSpace($history)) {
                $fuck = $(thefuck $args $history);
                if (-not [string]::IsNullOrWhiteSpace($fuck)) {
                    if ($fuck.StartsWith("echo")) { $fuck = $fuck.Substring(5); }
                    else { Invoke-Expression "$fuck"; }
                }
            }
            [Console]::ResetColor()
        }
    }
}
