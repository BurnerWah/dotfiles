# Set up Kitty's shell integrations whenever kitty isn't already going to.
# This is needed because numbered scripts get run before Kitty's automatic integration.
if not set -q KITTY_FISH_XDG_DATA_DIR # This is how kitty applies shell integrations
    and status is-interactive # Require an interactive session

    set -l shell_integration_conf "shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"

    # This is intended for use with manual shell integrations
    if set -q KITTY_INSTALLATION_DIR

        set -g KITTY_SHELL_INTEGRATION enabled
        # @fish-lsp-disable-next-line 1004
        source "$KITTY_INSTALLATION_DIR/$shell_integration_conf"
        set -p fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"

        # This is for SSH & Lima VMs
    else if test "$TERM" = xterm-kitty
        and set -q SSH_TTY
        and set -l paths (path filter -fr "/usr/lib64/kitty/$shell_integration_conf" "/usr/lib/kitty/$shell_integration_conf")

        set -g KITTY_SHELL_INTEGRATION enabled
        source "$paths[1]"

    end
end
