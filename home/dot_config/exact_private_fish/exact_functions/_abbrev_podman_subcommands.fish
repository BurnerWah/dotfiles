function _abbrev_podman_subcommands
    # This doesn't have any subcommand-of-subcommand support because that's very annoying to implement right now
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?podman $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case context ctx
            echo 'system connection'
        case gen
            echo generate
        case health hc
            echo healthcheck
        case net
            echo network
        case sys
            echo system
        case vol
            echo volume
            # keep-sorted end
        case '*'
            echo $argv
    end
end
