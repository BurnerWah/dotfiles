if set -l paths (path filter -fr $__fish_vendor_completionsdirs/folderify.fish)
    source $paths[1]
else
    folderify --completions fish | source
end
