() {
    local plugin
    local plugins=(
        fast-syntax-highlighting
        zsh-autosuggestions
        zsh-autopair
        zsh-history-substring-search

        atuin
        direnv
        zoxide
    )
    for plugin in $plugins; do
        source $ZDOTDIR/plugins/$plugin/*.plugin.zsh
    done
}
