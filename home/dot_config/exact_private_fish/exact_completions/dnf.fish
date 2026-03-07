# I'm working on a carapace completer for dnf5, so this isn't a symlink to assist with developing that
if command -q dnf_completer
    __fish_cache_sourced_completions dnf_completer _carapace fish
else if command -q carapace
    complete -c dnf -f -a '(_carapace_completer dnf)'
else
    source $__fish_data_dir/completions/dnf.fish
end
