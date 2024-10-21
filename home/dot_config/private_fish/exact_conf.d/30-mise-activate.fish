if command -qs mise
    if not status is-interactive
        or status is-login
        or [ "$TERM_PROGRAM" = vscode ] # Don't activate in IDEs
        or [ "$TERMINAL_EMULATOR" = JetBrains-JediTerm ] # Don't activate in IDEs
        mise activate fish --shims | source
    else
        mise activate fish | source
    end
end
