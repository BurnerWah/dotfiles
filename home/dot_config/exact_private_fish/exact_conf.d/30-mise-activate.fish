# Note - Under some conditions `mise activate --shims` can result in shims
# being at the end of $PATH, instead of at the start. `fish_add_path -g` can
# work around that issue, but I don't currently include any code for that in my
# dotfiles.
if command -q mise
    if not status is-interactive
        or status is-login
        or [ "$TERM_PROGRAM" = vscode ] # Don't activate in IDEs
        or [ "$TERMINAL_EMULATOR" = JetBrains-JediTerm ] # Don't activate in IDEs
        mise activate fish --shims | source
    else
        mise activate fish | source
    end
end
