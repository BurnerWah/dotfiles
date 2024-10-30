# Netlify's generated completion script is bad. It assumes the completion
# script is executable (often not the case), relies on the default scope set
# applies (which is local, but that's unclear), underutilizes local exports,
# uses a lot of unnecessary evals, sets an unnecessary description for
# completions, and it forks into node to split a string.
# Additionally, they use a hardcoded script path.
# This should be much more efficient and straightforward.
function _netlify_completion
    set -l cmd (commandline -o)
    set -lx DEBUG " "
    set -lx COMP_CWORD (count (string split -r " " $cmd))
    set -lx COMP_LINE "$cmd "
    set -lx COMP_POINT (commandline -C)
    if set -l netlify_cmd (command -s netlify)
        # TODO: Add support for other install methods
        if [ "$netlify_cmd" = /opt/homebrew/bin/netlify ]
            node /opt/homebrew/opt/netlify-cli/libexec/lib/node_modules/netlify-cli/src/lib/completion/script.js completion -- $cmd
        end
    end
end

complete -f -c netlify -a "(_netlify_completion)"
