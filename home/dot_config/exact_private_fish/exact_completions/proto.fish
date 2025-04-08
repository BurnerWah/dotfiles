if set -l paths (path filter -fr $__fish_vendor_completionsdirs/proto.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions proto completions --shell fish
end
