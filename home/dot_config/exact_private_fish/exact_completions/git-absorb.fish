if set -l paths (path filter -fr $__fish_vendor_completionsdirs/git-absorb.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions git-absorb --gen-completions fish
end
