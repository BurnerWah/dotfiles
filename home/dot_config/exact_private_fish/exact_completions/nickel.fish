if set -l paths (path filter -fr $__fish_vendor_completionsdirs/nickel.fish)
    source $paths[1]
else
    nickel gen-completions fish | source
end
