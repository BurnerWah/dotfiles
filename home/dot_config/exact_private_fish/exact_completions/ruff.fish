function _ruff_shimmed
    if ruff -V &>/dev/null
        complete -c ruff -e
        ruff generate-shell-completion fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c ruff -f -a '(_ruff_shimmed)'
