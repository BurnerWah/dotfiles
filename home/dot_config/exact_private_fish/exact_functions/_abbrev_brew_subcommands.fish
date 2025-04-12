# chezmoi:template:left-delimiter="# {{" right-delimiter=}}
function _abbrev_brew_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?brew $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        case dr
            echo doctor
        case home
            echo homepage
        case abv
            echo info
        case ln
            echo link
        case ls
            echo list
        case post_install
            echo postinstall
        case rm remove
            echo uninstall
        case up
            echo update
        case lc
            echo livecheck
        case tc
            echo typecheck
        case '*'
            echo $argv
    end
end
