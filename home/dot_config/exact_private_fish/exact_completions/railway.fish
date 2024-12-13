if set -l paths (path filter -fr $__fish_vendor_completionsdirs/railway.fish)
    source $paths[1]
else
    railway completion fish | source
end
