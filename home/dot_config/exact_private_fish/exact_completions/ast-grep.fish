if set -l paths (path filter -fr $__fish_vendor_completionsdirs/ast-grep.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions ast-grep completions fish
end
