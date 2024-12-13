if set -l paths (path filter -fr $__fish_vendor_completionsdirs/procs.fish)
    source $paths[1]
else
    procs --gen-completion-out fish | source
end
