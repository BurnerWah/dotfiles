function _pdm_shimmed
    if string match -vq "*/mise/shims/pdm" (command -s pdm)
        or pdm -V &>/dev/null
        complete -c pdm -e
        pdm completion fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c pdm -f -a '(_pdm_shimmed)'
