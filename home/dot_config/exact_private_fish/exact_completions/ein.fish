if set -l paths (path filter -fr $__fish_vendor_completionsdirs/ein.fish)
    source $paths[1]
else
    ein completions --shell fish | source
end
