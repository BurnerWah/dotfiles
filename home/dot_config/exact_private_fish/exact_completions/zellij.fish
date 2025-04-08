if set -l paths (path filter -fr $__fish_vendor_completionsdirs/zellij.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions zellij setup --generate-completion fish
end
