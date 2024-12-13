if set -l paths (path filter -fr $__fish_vendor_completionsdirs/uv.fish)
    source $paths[1]
else
    uv generate-shell-completion fish | source
end
