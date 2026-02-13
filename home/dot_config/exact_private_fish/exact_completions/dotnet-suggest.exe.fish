set -l cmd (status basename | path change-extension '')
complete -c $cmd -f -a "(_dotnet_suggest_wsl_completer $cmd)"
