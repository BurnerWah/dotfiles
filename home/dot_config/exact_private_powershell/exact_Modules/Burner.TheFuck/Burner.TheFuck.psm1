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
