# {{ if ne (lookPath "ruff") "" }}
# ruff hash: {{ include (joinPath .pkg.scoop.apps "ruff/current/ruff.exe") | sha256sum }}
$Script:TargetPath = "{{ .chezmoi.targetFile }}"
ruff generate-shell-completion powershell > $Script:TargetPath
# {{ end }}
