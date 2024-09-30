status is-interactive || exit 0
command -qs direnv || exit

direnv hook fish | source
