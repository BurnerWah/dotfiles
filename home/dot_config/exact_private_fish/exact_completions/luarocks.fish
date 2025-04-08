if set -l paths (path filter -fr $__fish_vendor_completionsdirs/luarocks.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions luarocks completion fish
end
