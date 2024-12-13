if set -l paths (path filter -fr $__fish_vendor_completionsdirs/pueue.fish)
    source $paths[1]
else
    pueue completions fish | source
end
