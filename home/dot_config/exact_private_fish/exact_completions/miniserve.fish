if set -l paths (path filter -fr $__fish_vendor_completionsdirs/miniserve.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions miniserve --print-completions fish
end
