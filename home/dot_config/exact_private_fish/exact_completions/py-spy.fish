if set -l paths (path filter -fr $__fish_vendor_completionsdirs/py-spy.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions py-spy completions fish
end
