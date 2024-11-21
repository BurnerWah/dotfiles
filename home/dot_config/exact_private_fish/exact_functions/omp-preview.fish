function omp-preview --description 'Preview an oh-my-posh theme' --argument theme
    set -l theme_dir
    if set -q POSH_THEMES_PATH
        set theme_dir "$POSH_THEMES_PATH"
    else if test -d "$HOMEBREW_PREFIX/opt/oh-my-posh"
        set theme_dir "$HOMEBREW_PREFIX/opt/oh-my-posh/themes"
    else
        echo "Oh My Posh themes not found."
        return 1
    end
    oh-my-posh --config $theme_dir/$theme.omp.* print primary
end
