if set -l paths (path filter -fr $__fish_vendor_completionsdirs/pkl.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions pkl shell-completion fish
end
