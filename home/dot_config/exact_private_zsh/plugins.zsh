() {
    local plugin
    local plugins=(
        fast-syntax-highlighting
        zsh-autosuggestions
        zsh-autopair
        zsh-history-substring-search

        command-not-found
        atuin
        direnv
        zoxide
        mise
        iterm2
        shadowenv
        carapace
        starship
        thefuck
    )
    for plugin in $plugins; do
        source $ZDOTDIR/plugins/$plugin/*.plugin.zsh
    done
}
