if set -l paths (path filter -fr $__fish_vendor_completionsdirs/gix.fish)
    source $paths[1]
else
    gix completions --shell fish | source
end
