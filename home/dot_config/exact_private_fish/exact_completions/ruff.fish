function _ruff_shimmed
    if string match -vq "*/mise/shims/ruff" (command -s ruff)
        or ruff -V &>/dev/null
        complete -c ruff -e
        ruff generate-shell-completion fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c ruff -f -a '(_ruff_shimmed)'
