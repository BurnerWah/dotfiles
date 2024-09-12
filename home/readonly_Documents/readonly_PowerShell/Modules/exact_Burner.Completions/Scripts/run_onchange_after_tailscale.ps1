# {{ if ne (lookPath "tailscale") "" }}
# tailscale hash: {{ include (lookPath "tailscale") | sha256sum }}
$Script:TargetPath = "{{ .chezmoi.targetFile }}"
tailscale completion powershell > $Script:TargetPath
# {{ end }}
