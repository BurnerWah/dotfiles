function _abbrev_npm_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?npm $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case add i in ins inst insta instal isnt isnta isntal isntall
            echo install
        case add-user
            echo adduser
        case author
            echo owner
        case c
            echo config
        case cit clean-install-test sit
            echo install-ci-test
        case clean-install ic install-clean isntall-clean
            echo ci
        case create innit
            echo init
        case ddp
            echo dedupe
        case dist-tags
            echo dist-tag
        case hlep
            echo help
        case home
            echo docs
        case issues
            echo bugs
        case it
            echo install-test
        case la
            echo ll
        case list
            echo ls
        case ln
            echo link
        case ogr
            echo org
        case rb
            echo rebuild
        case run-script rum urn
            echo run # run-script is true command but run is better
        case s se find
            echo search
        case t tst
            echo test
        case un unlink remove rm r
            echo uninstall
        case up upgrade udpate
            echo update
        case v info show
            echo view
        case verison
            echo version
        case why
            echo explain
        case x
            echo exec
            # keep-sorted end
        case '*'
            echo $argv
    end
end
