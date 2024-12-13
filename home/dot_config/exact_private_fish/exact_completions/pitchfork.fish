function _pitchfork_shimmed
    if string match -vq "*/mise/shims/pitchfork" (command -s pitchfork)
        or pitchfork -V &>/dev/null
        complete -c pitchfork -e
        pitchfork completion fish | source
        complete --do-complete=(commandline -cp)
    end
end

complete -c pitchfork -f -a '(_pitchfork_shimmed)'
