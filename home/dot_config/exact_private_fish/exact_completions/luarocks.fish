if set -l paths (path filter -fr $__fish_vendor_completionsdirs/luarocks.fish)
    source $paths[1]
else
    luarocks completion fish | source
end
