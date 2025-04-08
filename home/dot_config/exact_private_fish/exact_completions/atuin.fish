if set -l paths (path filter -fr $__fish_vendor_completionsdirs/atuin.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions atuin gen-completions --shell fish
end
