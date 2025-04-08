if set -l paths (path filter -fr $__fish_vendor_completionsdirs/uv.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions uv generate-shell-completion fish
end
