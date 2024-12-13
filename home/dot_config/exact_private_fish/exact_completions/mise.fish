if set -l paths (path filter -fr $__fish_vendor_completionsdirs/mise.fish)
    source $paths[1]
else
    mise completion fish | source
end
