set -l cmd (status basename | path change-extension '')
if command -q carapace
    complete -c $cmd -f -a "(_carapace_completer $cmd)"
else if set -l paths (path filter -fr $__fish_vendor_completionsdirs/{$cmd}.fish $__fish_data_dir/completions/{$cmd}.fish)
    source $paths[1]
end
