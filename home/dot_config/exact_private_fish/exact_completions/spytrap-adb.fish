if set -l paths (path filter -fr $__fish_vendor_completionsdirs/spytrap-adb.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions spytrap-adb completions fish
end
