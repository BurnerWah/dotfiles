autoload -Uz zrecompile
autoload -Uz add-zsh-hook
# autoload -Uz run-help

# Terminal integration & prompt
case "$TERM_PROGRAM" in
iTerm.app)
    source /Applications/iTerm.app/Contents/Resources/iterm2_shell_integration.zsh
    eval "$(starship init zsh)"
    # eval "$(oh-my-posh init zsh)"
    ;;
*)
    eval "$(starship init zsh)"
    # eval "$(oh-my-posh init zsh)"
    ;;
esac

# History file in caches
HISTFILE=${XDG_CACHE_HOME}/zsh_history
setopt APPEND_HISTORY
setopt EXTENDED_GLOB
setopt NOTIFY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS
setopt COMPLETE_IN_WORD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
# setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt NO_BEEP
# setopt REMATCH_PCRE
setopt CSH_JUNKIE_LOOPS # fuck you this is better

# eval "$(bkt --env BKT_SHELL_KEY --ttl 1week --modtime /opt/homebrew/opt/thefuck/INSTALL_RECEIPT.json -- thefuck --alias)"

source "$ZDOTDIR/aliases.zsh"

fpath=(
    "$ZDOTDIR/functions/override" # Limited to fixes for things
    $fpath
    "$ZDOTDIR/functions/carapace"
    "$ZDOTDIR/functions"
    "/opt/homebrew/share/zsh/site-functions"
    "/opt/homebrew/opt/zsh-completions/share/zsh-completions" # Zsh accepts this dir as secure
)

autoload -Uz compinit
compinit

zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

source "$ZDOTDIR/plugins.zsh"
