# Generic carapace completion, to symlink things to, built against v1.6.1
set -l cmd (status basename | path change-extension '')
complete -c $cmd -f -a "(_carapace_completer $cmd)"
