fish_add_path --path --prepend "$HOME/.local/bin"

if set -q SSH_TTY
    set -q HOMEBREW_PREFIX || set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
end

fish_add_path --path --append "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin"
