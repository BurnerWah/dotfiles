# Some programs rely on XDG_RUNTIME_DIR to use the correct paths
# On Mac OS, TMPDIR is already user-specific so that should be fine
set -gx XDG_RUNTIME_DIR $TMPDIR

if status is-interactive
    if command -qs brew
        set -l HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
        if test -f $HB_CNF_HANDLER
            source $HB_CNF_HANDLER
        end
    end
end
