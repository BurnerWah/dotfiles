# Some programs rely on XDG_RUNTIME_DIR to use the correct paths
# On Mac OS, TMPDIR is already user-specific so that should be fine
set -gx XDG_RUNTIME_DIR $TMPDIR

if status is-interactive
    and command -qs brew
    # Skip running `brew --repository` if we already know what it should output
    [ -n "$HOMEBREW_REPOSITORY" ] || set -l HOMEBREW_REPOSITORY (brew --repository)

    set -l HB_CNF_HANDLER "$HOMEBREW_REPOSITORY/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
    if test -f $HB_CNF_HANDLER
        source $HB_CNF_HANDLER
    end
end
