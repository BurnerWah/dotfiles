if set -l paths (path filter -fr $__fish_vendor_completionsdirs/spytrap-adb.fish)
    source $paths[1]
else
    spytrap-adb completions fish | source
end
