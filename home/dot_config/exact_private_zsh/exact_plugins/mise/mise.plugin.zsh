# The omz plugin also generates completions, but that's not needed with
# the fallback completion system. Also, this can't switch to the shims
# mode, but I don't know how to do that in zsh.
# eval-ed script is not cacheable, and varies depending on what $PATH is
if (( $+commands[mise] )); then
    eval "$(mise activate zsh)"
fi
