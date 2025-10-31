() {
    local plugin
    local plugins=(
        zsh-autosuggestions
        zsh-autopair
        zsh-history-substring-search
        f-sy-h

        command-not-found
        atuin
        zoxide
        mise
        iterm2
        starship
        thefuck
    )
    for plugin in $plugins; do
        source $ZDOTDIR/plugins/$plugin/*.plugin.zsh
    done
}
