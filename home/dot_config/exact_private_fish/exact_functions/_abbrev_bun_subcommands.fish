function _abbrev_bun_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?bun $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case a
            echo add
        case c
            echo create
        case i
            echo install
        case rm
            echo remove
        case up
            echo update
            # keep-sorted end
        case '*'
            echo $argv
    end
end
