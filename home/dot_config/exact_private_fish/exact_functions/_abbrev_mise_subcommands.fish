function _abbrev_mise_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?mise $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
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
        case x
            echo exec
        case gen
            echo generate
        case i
            echo install
        case ln
            echo link
        case list
            echo ls
        case p
            echo plugins
        case r
            echo run
        case sh
            echo shell
        case t
            echo tasks
        case rm remove
            echo unuse
        case up
            echo upgrade
        case u
            echo use
        case v
            echo version
        case w
            echo watch
        case '*'
            echo $argv
    end
end
