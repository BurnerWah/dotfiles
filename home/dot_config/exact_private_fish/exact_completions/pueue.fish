if set -l paths (path filter -fr $__fish_vendor_completionsdirs/pueue.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions pueue completions fish
end
