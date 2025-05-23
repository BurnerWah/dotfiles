if status is-interactive
    and command -q starship
    and [ "$TERMINAL_EMULATOR" != JetBrains-JediTerm ] # JetBrains IDEs misbehave with starship
    and [ "$__CFBundleIdentifier" != "com.fournova.Tower3" ] # Tower just wants to see some env vars
    starship init fish | source
end
