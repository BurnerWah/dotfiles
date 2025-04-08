if set -l paths (path filter -fr $__fish_vendor_completionsdirs/folderify.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions folderify --completions fish
end
