if set -l paths (path filter -fr $__fish_vendor_completionsdirs/ein.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions ein completions --shell fish
end
