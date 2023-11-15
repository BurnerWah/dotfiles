if command -qs carapace
    carapace gulp fish | source
else
    gulp --completion=fish | source
end
