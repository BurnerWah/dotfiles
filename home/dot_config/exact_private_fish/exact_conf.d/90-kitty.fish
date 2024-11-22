# Set up Kitty's shell integrations whenever kitty isn't already going to.
# This is needed because numbered scripts get run before Kitty's automatic integration.
if not set -q KITTY_FISH_XDG_DATA_DIR # This is how kitty applies shell integrations
    and status is-interactive # Require an interactive session
    and set -q KITTY_INSTALLATION_DIR # This is intended for use with manual shell integrations

    set -g KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set -p fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
