if set -l paths (path filter -fr $__fish_vendor_completionsdirs/git-absorb.fish)
    source $paths[1]
else
    git-absorb --gen-completions fish | source
end
