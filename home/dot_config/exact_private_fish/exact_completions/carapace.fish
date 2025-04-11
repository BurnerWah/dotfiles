# Generic carapace completion, to symlink things to
if command -q carapace
    carapace (status basename | string replace .fish '') fish | source
end
