if set -l paths (path filter -fr $__fish_vendor_completionsdirs/proto.fish)
    source $paths[1]
else
    proto completions --shell fish | source
end
