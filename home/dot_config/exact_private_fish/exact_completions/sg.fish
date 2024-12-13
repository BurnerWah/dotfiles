if set -l paths (path filter -fr $__fish_vendor_completionsdirs/sg.fish)
    source $paths[1]
else
    sg completions fish | source
end
