if status is-interactive
    and command -qs starship
    and [ "$__CFBundleIdentifier" != "com.fournova.Tower3" ] # Tower just wants to see some env vars
    starship init fish | source
end
