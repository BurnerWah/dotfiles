if set -l paths (path filter -fr $__fish_vendor_completionsdirs/zellij.fish)
    source $paths[1]
else
    zellij setup --generate-completion fish | source
end
