# Avoids subshell when running `chezmoi cd` if possible
function chezmoi -d 'Manage your dotfiles across multiple diverse machines, securely'
    # Don't waste time parsing arguments if cd argument isn't provided
    if contains cd -- $argv
        # Save original argv in case we need to run chezmoi normally
        set -l argv_orig $argv

        # We're not using `argparse -s` since the arguments can be after the
        # subcommand
        argparse \
            cache= color= c/config= config-format= debug D/destination= \
            n/dry-run force h/help interactive k/keep-going mode= no-pager \
            no-tty o/output= persistent-state= progress= R/refresh-externals= \
            S/source= source-path use-builtin-age= use-builtin-diff \
            use-builtin-git= v/verbose version W/working-tree= \
            -- $argv
        or return

        if [ "$argv[1]" != cd ] # Accurate check to see if `chezmoi cd` was run
            or set -ql _flag_debug # Retain debug output
            or set -ql _flag_help # Retian help page
            or set -ql _flag_version # Show version
            command chezmoi $argv_orig
        else if set -ql _flag_source
            # --source seems to decide where chezmoi will cd to if provided,
            # but --working-tree doesn't
            cd $_flag_source
        else
            # `chezmoi execute-template` is used because `chezmoi source-path`
            # doesn't output where `chezmoi cd` goes when a .chezmoiroot file
            # exists
            set -l CHEZMOI_WORKING_TREE (command chezmoi execute-template '{{ .chezmoi.workingTree }}')
            cd $CHEZMOI_WORKING_TREE
        end
    else
        command chezmoi $argv
    end
end
