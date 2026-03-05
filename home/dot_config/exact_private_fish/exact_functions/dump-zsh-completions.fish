function dump-zsh-completions
    set -l zsh_ignore_completions \
        zsh-mime-handler zstat zpty zsocket zsetattr zdelattr ztodo zlistattr \
        zgetattr zcalc zargs zln zmv zcp compdef complete-word add-zsh-hook \
        vcs_info_hookadd vcs_info_hookdel Mail
    # Most of these are builtins that aren't guaranteed to be loaded initially,
    # but still make no sense to compare between shells.
    # `Mail` is here because it screws up analysis on Mac OS.

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
        | string match -v 'zf_*' \
        | string match -vr "^($(zsh -c 'echo ${(k)builtins}' | string split ' ' | string match -r '[a-z]+' | string join '|'))\$" \
        | string match -vr "^($(string join '|' $zsh_ignore_completions))\$" \
        | sort -u
end
