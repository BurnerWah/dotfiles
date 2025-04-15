function _abbrev_brew_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?brew $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case abv
            echo info
        case dr
            echo doctor
        case home
            echo homepage
        case lc
            echo livecheck
        case ln
            echo link
        case ls
            echo list
        case post_install
            echo postinstall
        case rm remove
            echo uninstall
        case tc
            echo typecheck
        case up
            echo update
            # keep-sorted end
        case '*'
            echo $argv
    end
end
