# Some programs rely on XDG_RUNTIME_DIR to use the correct paths
# On Mac OS, TMPDIR is already user-specific so that should be fine
set -gx XDG_RUNTIME_DIR $TMPDIR

# Sonarlint stores temporary files in ~/.sonarlint and that folder can
# get *really* big
set -gx SONARLINT_USER_HOME "$TMPDIR/sonarlint"

if status is-interactive
    and command -qs brew
    # Skip running `brew --repository` if we already know what it should output
    [ -n "$HOMEBREW_REPOSITORY" ] || set -l HOMEBREW_REPOSITORY (brew --repository)

    set -l HB_CNF_HANDLER "$HOMEBREW_REPOSITORY/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
    if test -f $HB_CNF_HANDLER
        source $HB_CNF_HANDLER
    end
end

# Use the 1Password SSH socket
if [ -d /Applications/1Password.app ]
    and [ "$__CFBundleIdentifier" = "com.microsoft.VSCode" ]
    and string match "/private/tmp/com.apple.launchd.*" "$SSH_AUTH_SOCK"
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end
