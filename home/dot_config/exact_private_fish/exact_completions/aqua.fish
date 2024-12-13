if set -l paths (path filter -fr $__fish_vendor_completionsdirs/aqua.fish)
    source $paths[1]
else
    aqua completion fish | source
end
