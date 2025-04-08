if command -qs carapace
    carapace gulp fish | source
else
    __fish_cache_sourced_completions gulp --completion=fish
end
