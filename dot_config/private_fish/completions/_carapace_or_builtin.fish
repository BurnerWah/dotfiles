# Generic script to use carapace if possible, but fall back on fish's built-in
# completion scripts for a given command
set -l cmd (status basename | string replace .fish '')
if command -qs carapace
    carapace $cmd fish | source
else
    source $__fish_data_dir/completions/{$cmd}.fish
end
