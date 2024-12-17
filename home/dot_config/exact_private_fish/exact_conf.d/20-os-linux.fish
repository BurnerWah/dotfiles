set -q XDG_CONFIG_HOME || set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME || set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME || set -gx XDG_CACHE_HOME "$HOME/.cache"

if set -q SSH_TTY
    fish_add_path --path --prepend "$HOME/.local/bin"
    fish_add_path --path --append "$XDG_DATA_HOME/homebrew/bin"
    fish_add_path --path --append "$XDG_DATA_HOME/homebrew/sbin"

    # This runs before fedora's *-default-editor scripts
    set -q EDITOR || set -gx EDITOR nvim
end
