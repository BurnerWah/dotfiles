if set -l paths (path filter -fr $__fish_vendor_completionsdirs/genact.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions genact --print-completions fish
end
