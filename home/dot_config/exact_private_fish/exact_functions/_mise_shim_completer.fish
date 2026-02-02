function _mise_shim_completer -d "Load completions for a mise shim"
    # TODO: Allow version-specific cached completions
    # (that probably requires using `mise tool`)
    if string match -vq "*/mise/shims/$argv[1]" -- (command -s -- $argv[1])
        complete -c $argv[1] -e
        __fish_cache_sourced_completions $argv
        complete --do-complete=(commandline -cp)
    else if mise which -q $argv[1] &>/dev/null
        complete -c $argv[1] -e
        $argv | source
        complete --do-complete=(commandline -cp)
    end
end
