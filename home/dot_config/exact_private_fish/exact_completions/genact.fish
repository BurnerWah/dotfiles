if set -l paths (path filter -fr $__fish_vendor_completionsdirs/genact.fish)
    source $paths[1]
else
    genact --print-completions fish | source
end
