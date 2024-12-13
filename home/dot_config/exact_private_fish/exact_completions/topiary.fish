if set -l paths (path filter -fr $__fish_vendor_completionsdirs/topiary.fish)
    source $paths[1]
else
    topiary completion fish | source
end
