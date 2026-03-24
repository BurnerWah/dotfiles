# Must be ordered after mise as it may be installed that way, and must be
# ordered before anything that could depend on a service loaded via pitchfork
if status is-interactive
    and command -q pitchfork
    and [ "$__CFBundleIdentifier" != "com.fournova.Tower3" ] # Tower just wants to see some env vars
    pitchfork activate fish | source
end
