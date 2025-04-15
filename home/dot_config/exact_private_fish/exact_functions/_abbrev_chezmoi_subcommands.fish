function _abbrev_chezmoi_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?chezmoi $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case a
            echo add
        case dr
            echo doctor
        case s
            echo status
        case up
            echo update
            # keep-sorted end
        case '*'
            echo $argv
    end
end
