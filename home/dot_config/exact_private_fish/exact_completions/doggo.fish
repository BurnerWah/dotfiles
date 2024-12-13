if set -l paths (path filter -fr $__fish_vendor_completionsdirs/doggo.fish)
    source $paths[1]
else
    doggo completions fish | source
end
