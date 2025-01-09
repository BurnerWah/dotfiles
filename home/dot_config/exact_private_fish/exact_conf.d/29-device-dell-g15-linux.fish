if set -q SSH_TTY
    fish_add_path --path --prepend "$HOME/.local/bin"
    fish_add_path --path --append "$XDG_DATA_HOME/homebrew/bin"
    fish_add_path --path --append "$XDG_DATA_HOME/homebrew/sbin"

    # This runs before fedora's *-default-editor scripts
    set -q EDITOR || set -gx EDITOR nvim
end
