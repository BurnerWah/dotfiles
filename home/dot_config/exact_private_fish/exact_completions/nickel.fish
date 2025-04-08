if set -l paths (path filter -fr $__fish_vendor_completionsdirs/nickel.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions nickel gen-completions fish
end
