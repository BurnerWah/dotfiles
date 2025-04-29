if set -l paths (path filter -fr $__fish_vendor_completionsdirs/swiftlint.fish)
    source $paths[1]
else
    __fish_cache_sourced_completions swiftlint --generate-completion-script=fish
end
