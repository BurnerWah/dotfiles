if [ -r "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.fish" ]
    source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.fish"
else if [ -r "$HOME/.local/opt/asdf/asdf.fish" ]
    source "$HOME/.local/opt/asdf/asdf.fish"
end
