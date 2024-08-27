# {{ if ne (lookPath "zola") "" }}
# zola hash: {{ include (joinPath .pkg.scoop.apps "zola/current/zola.exe") | sha256sum }}
$Script:TargetPath = "{{ .chezmoi.targetFile }}"
zola completion powershell > $Script:TargetPath
# {{ end }}
