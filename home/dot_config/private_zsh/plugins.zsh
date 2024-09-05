() {
    local plugin
    local plugins=(
        fast-syntax-highlighting
        zsh-autocomplete
        zsh-autopair

        atuin
        direnv
        zoxide
    )
    # local plugins=(
    #     "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    #     "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
    # )
    for plugin in $plugins; do
        source $ZDOTDIR/plugins/$plugin/*.plugin.zsh
    done
}
