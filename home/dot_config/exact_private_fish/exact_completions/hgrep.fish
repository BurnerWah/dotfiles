if set -l paths (path filter -fr $__fish_vendor_completionsdirs/hgrep.fish)
    source $paths[1]
else
    hgrep --generate-completion-script fish | source
end
