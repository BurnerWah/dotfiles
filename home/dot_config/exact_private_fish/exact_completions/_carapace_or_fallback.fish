set -l cmd (status basename | string replace .fish '')
if command -qs carapace
    carapace $cmd fish | source
else if set -l paths (path filter -fr $__fish_vendor_completionsdirs/{$cmd}.fish $__fish_data_dir/completions/{$cmd}.fish)
    source $paths[1]
end
