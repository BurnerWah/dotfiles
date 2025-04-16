function _abbrev_dnf_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?dnf $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case check-update
            echo check-upgrade
        case dg
            echo downgrade
        case dsync
            echo distro-sync
        case grp
            echo group
        case if
            echo info
        case in
            echo install
        case ls
            echo list
        case mc
            echo makecache
        case rei
            echo reinstall
        case repoinfo
            echo 'repo info'
        case repolist
            echo 'repo list'
        case rm
            echo remove
        case rq
            echo repoquery
        case se
            echo search
        case up update
            echo upgrade
        case updateinfo
            echo advisory
        case upgrade-minimal
            echo 'upgrade --minimal'
            # keep-sorted end
        case '*'
            echo $argv
    end
end
