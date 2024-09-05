() {
    local plugin
    local plugins=(
        "/opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
        "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        "/opt/homebrew/share/zsh-autopair/autopair.zsh"
        "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
    )
    for plugin in $plugins; do
        source $plugin
    done
}
