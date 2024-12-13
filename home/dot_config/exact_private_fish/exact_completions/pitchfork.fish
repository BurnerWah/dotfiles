function _pitchfork_shimmed
    if pitchfork -V &>/dev/null
        complete -c pitchfork -e
        pitchfork completion fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c pitchfork -f -a '(_pitchfork_shimmed)'
