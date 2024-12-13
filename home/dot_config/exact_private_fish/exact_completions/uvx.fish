if set -l paths (path filter -fr $__fish_vendor_completionsdirs/uvx.fish)
    source $paths[1]
else
    uvx --generate-shell-completion fish | source
end
