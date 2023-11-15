# Carapace is faster than fish's built-in completions
if command -qs carapace
    carapace az fish | source
else
    source $__fish_data_dir/completions/az.fish
end
