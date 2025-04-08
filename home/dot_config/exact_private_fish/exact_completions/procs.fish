if set -l paths (path filter -fr $__fish_vendor_completionsdirs/procs.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions procs --gen-completion-out fish
end
