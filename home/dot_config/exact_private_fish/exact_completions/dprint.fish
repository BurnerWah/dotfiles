function _dprint_shimmed
    if string match -vq "*/mise/shims/dprint" (command -s dprint)
        or dprint -V &>/dev/null
        complete -c dprint -e
        dprint completions fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c dprint -f -a '(_dprint_shimmed)'
