# {{ if ne (lookPath "miniserve") "" }}
# miniserve hash: {{ include (joinPath .pkg.scoop.apps "miniserve/current/miniserve.exe") | sha256sum }}
$Script:TargetPath = "{{ .chezmoi.targetFile }}"
miniserve --print-completions powershell > $Script:TargetPath
# {{ end }}
