if set -l paths (path filter -fr $__fish_vendor_completionsdirs/doggo.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions doggo completions fish
end
