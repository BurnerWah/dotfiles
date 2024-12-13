if set -l paths (path filter -fr $__fish_vendor_completionsdirs/atuin.fish)
    source $paths[1]
else
    atuin gen-completions --shell fish | source
end
