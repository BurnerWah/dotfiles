# Ensures that completions for sentry-cli don't get defined when the CLI isn't
# actually available yet, ex. because it's a mise shim, and avoids interference
# from the 1Password CLI.

function _sentry_shimmed
    if string match -vq "*/mise/shims/sentry-cli" (command -s sentry-cli)
        or command sentry-cli -V &>/dev/null
        complete -c sentry-cli -e
        command sentry-cli completions fish 2>/dev/null | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c sentry-cli -f -a '(_sentry_shimmed)'
