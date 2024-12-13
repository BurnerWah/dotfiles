if set -l paths (path filter -fr $__fish_vendor_completionsdirs/py-spy.fish)
    source $paths[1]
else
    py-spy completions fish | source
end
