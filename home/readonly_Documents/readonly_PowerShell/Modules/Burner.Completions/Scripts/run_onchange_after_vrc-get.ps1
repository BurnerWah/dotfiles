# {{ if ne (lookPath "vrc-get") "" }}
# vrc-get hash: {{ include (joinPath .pkg.scoop.apps "vrc-get/current/vrc-get.exe") | sha256sum }}
$Script:TargetPath = "{{ .chezmoi.targetFile }}"
vrc-get completion powershell > $Script:TargetPath
# {{ end }}
