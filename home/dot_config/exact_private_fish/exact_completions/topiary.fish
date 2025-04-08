if set -l paths (path filter -fr $__fish_vendor_completionsdirs/topiary.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions topiary completion fish
end
