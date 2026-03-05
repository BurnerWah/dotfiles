function dump-zsh-completions
    begin
        set -l zsh_fpath \
            /usr/share/zsh/5.9/functions /usr/share/zsh/site-functions \
            /usr/local/share/zsh/site-functions \
            /opt/homebrew/share/zsh/site-functions

        head -n 1 $(path filter -d $zsh_fpath)/_* \
            | rg '#compdef' \
            | string replace '#compdef ' '' \
            | string split ' ' \
            | rg -o "^\w[\w.+-]*"

        rg -o "(?:^')\w[\w.+-]+'" $ZDOTDIR/.zcompdump | rg -o "\w[\w.+-]*"
    end | string replace '.exe' '' \
        | string match -v '_*' \
        | string match -v 'add-zle-*' \
        | string match -vr '^(unalias|printf|fc|getopts|hash|Mail)$' \
        | sort -u
    # Mail isn't a builtin, but it does make diffing this with dumped fish
    # completions annoying so I filtered it out anyways
end
