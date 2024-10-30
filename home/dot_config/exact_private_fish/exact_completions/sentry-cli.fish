# Ensures that completions for sentry-cli don't get defined when the CLI isn't
# actually available yet, ex. because it's a mise shim, and avoids interference
# from the 1Password CLI.

function _sentry_shimmed
    if command sentry-cli -V &>/dev/null
        complete -c sentry-cli -e
        command sentry-cli completions fish 2>/dev/null | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c sentry-cli -f -a '(_sentry_shimmed)'
