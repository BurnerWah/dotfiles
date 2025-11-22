if set -l paths (path filter -fr $__fish_vendor_completionsdirs/hk.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions hk completion fish
end
