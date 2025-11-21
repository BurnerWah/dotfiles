if set -l paths (path filter -fr $__fish_vendor_completionsdirs/fnox.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions fnox completion fish
end
