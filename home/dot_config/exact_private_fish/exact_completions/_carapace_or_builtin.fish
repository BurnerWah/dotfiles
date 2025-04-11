# Generic script to use carapace if possible, but fall back on fish's built-in
# completion scripts for a given command
set -l cmd (status basename | string replace .fish '')
if command -q carapace
    carapace $cmd fish | source
else
    # @fish-lsp-disable-next-line 1004
    source $__fish_data_dir/completions/{$cmd}.fish
end
