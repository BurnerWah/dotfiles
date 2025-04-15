function _abbrev_mise_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?mise $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case a
            echo alias
        case b
            echo backends
        case cfg
            echo config
        case dr
            echo doctor
        case e
            echo env
        case gen
            echo generate
        case i
            echo install
        case list
            echo ls
        case ln
            echo link
        case p
            echo plugins
        case r
            echo run
        case rm remove
            echo unuse
        case sh
            echo shell
        case t
            echo tasks
        case u
            echo use
        case up
            echo upgrade
        case v
            echo version
        case w
            echo watch
        case x
            echo exec
            # keep-sorted end
        case '*'
            echo $argv
    end
end
