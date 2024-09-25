#!/usr/bin/env fish
if status is-interactive
    # Mark scalar arrays
    set -q XDG_DATA_DIRS && set --path XDG_DATA_DIRS $XDG_DATA_DIRS
    set -q XDG_CONFIG_DIRS && set --path XDG_CONFIG_DIRS $XDG_CONFIG_DIRS
    set -q TERMINFO_DIRS && set --path TERMINFO_DIRS $TERMINFO_DIRS
    set -q GTK_RC_FILES && set --path GTK_RC_FILES $GTK_RC_FILES
    set -q GTK2_RC_FILES && set --path GTK2_RC_FILES $GTK2_RC_FILES
end
