if status is-interactive
    and command -q atuin
    and [ "$__CFBundleIdentifier" != "com.fournova.Tower3" ] # Tower just wants to see some env vars
    # Bail if WSL is acting up so the terminal isn't flooded with errors
    if [ -n "$WSL_INTEROP" ]
        [ -d "$XDG_RUNTIME_DIR" ] || exit 0
    end
    atuin init --disable-up-arrow fish | source
end
