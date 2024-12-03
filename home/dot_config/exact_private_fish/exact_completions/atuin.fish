if set -q HOMEBREW_PREFIX
    and [ -r "$HOMEBREW_PREFIX/share/fish/vendor_completions.d/atuin.fish" ]
    source "$HOMEBREW_PREFIX/share/fish/vendor_completions.d/atuin.fish"
else
    atuin gen-completions --shell fish | source
end
