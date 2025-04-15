function _abbrev_git_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?git $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case a
            echo add
        case b
            echo branch
        case c
            echo commit
        case co
            echo checkout
        case d
            echo diff
        case st
            echo status
            # keep-sorted end
        case '*'
            echo $argv
    end
end
