# Note - this shouldn't be run if direnv is installed via homebrew, as it
# already activates direnv. That having been said, the homebrew package uses
# the cellar path instead of the opt path, so the session gets messed up when
# direnv updates. It may be worth unlinking it and then manually activating
# direnv anyways.
if status is-interactive
    and command -qs direnv
    direnv hook fish | source
end
