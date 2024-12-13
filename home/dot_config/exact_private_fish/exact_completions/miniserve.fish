if set -l paths (path filter -fr $__fish_vendor_completionsdirs/miniserve.fish)
    source $paths[1]
else
    miniserve --print-completions fish | source
end
