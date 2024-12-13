if set -l paths (path filter -fr $__fish_vendor_completionsdirs/onefetch.fish)
    source $paths[1]
else
    onefetch --generate fish | source
end
