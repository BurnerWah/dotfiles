if status is-interactive
    and command -q atuin
    and [ "$__CFBundleIdentifier" != "com.fournova.Tower3" ] # Tower just wants to see some env vars
    atuin init --disable-up-arrow fish | source
end
