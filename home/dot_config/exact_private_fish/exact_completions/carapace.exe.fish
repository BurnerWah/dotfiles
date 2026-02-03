# Generic carapace completion to symlink things to, built against v1.6.1
# This variant is for WSL to use the host version of carapace
set -l cmd (status basename | path change-extension '')
complete -c $cmd -f -a "(_carapace_wsl_completer $(path change-extension '' $cmd))"
