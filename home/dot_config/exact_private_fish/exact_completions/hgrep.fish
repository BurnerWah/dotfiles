if set -l paths (path filter -fr $__fish_vendor_completionsdirs/hgrep.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions hgrep --generate-completion-script fish
end
