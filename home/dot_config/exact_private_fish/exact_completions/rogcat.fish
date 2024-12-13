if set -l paths (path filter -fr $__fish_vendor_completionsdirs/rogcat.fish)
    source $paths[1]
else
    rogcat completions fish | source
end
