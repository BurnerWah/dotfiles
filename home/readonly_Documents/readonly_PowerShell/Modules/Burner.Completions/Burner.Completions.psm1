. (Join-Path $PSScriptRoot "Scripts" "custom.ps1")
. (Join-Path $PSScriptRoot "Scripts" "lazy-managed.ps1")

$Script:scoop = "~\scoop\apps"

. (Join-Path $Script:scoop "hyperfine\current" "autocomplete\_hyperfine.ps1")
. (Join-Path $Script:scoop "pastel\current" "autocomplete\_pastel.ps1")
