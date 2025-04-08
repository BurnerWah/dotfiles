if set -l paths (path filter -fr $__fish_vendor_completionsdirs/uvx.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions uvx --generate-shell-completion fish
end
