function _abbrev_pnpm_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?pnpm $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case i
            echo install
        case it
            echo install-test
        case ln
            echo link
        case ls
            echo list
        case rb
            echo rebuild
        case rm
            echo remove
        case t
            echo test
        case up
            echo update
            # keep-sorted end
        case '*'
            echo $argv
    end
end
