if set -l paths (path filter -fr $__fish_vendor_completionsdirs/mas.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions mas --generate-completion-script=fish
end
