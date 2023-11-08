# Generic carapace completion, to symlink things to
if command -qs carapace
    carapace (status basename | string replace .fish '') fish | source
end
