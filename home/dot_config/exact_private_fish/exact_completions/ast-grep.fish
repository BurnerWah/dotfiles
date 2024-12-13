if set -l paths (path filter -fr $__fish_vendor_completionsdirs/ast-grep.fish)
    source $paths[1]
else
    ast-grep completions fish | source
end
