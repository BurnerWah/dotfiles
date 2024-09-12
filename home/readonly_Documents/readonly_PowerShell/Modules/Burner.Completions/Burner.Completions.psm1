. (Join-Path $PSScriptRoot "Scripts" "custom.ps1")

. (Join-Path $PSScriptRoot "Scripts" "vrc-get.ps1")
. (Join-Path $PSScriptRoot "Scripts" "tailscale.ps1")
. (Join-Path $PSScriptRoot "Scripts" "ruff.ps1")
. (Join-Path $PSScriptRoot "Scripts" "miniserve.ps1")
. (Join-Path $PSScriptRoot "Scripts" "uv.ps1")

$Script:scoop = "~\scoop\apps"

. (Join-Path $Script:scoop "hyperfine\current" "autocomplete\_hyperfine.ps1")
. (Join-Path $Script:scoop "pastel\current" "autocomplete\_pastel.ps1")
