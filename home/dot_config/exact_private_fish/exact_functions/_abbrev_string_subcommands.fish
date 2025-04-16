function _abbrev_string_subcommands
    # Check to ensure that this is the active subcommand
    if string match -qvr "^ ?string $argv " (commandline -pc)
        echo $argv
        return
    end
    switch "$argv"
        # keep-sorted start
        case c
            echo collect
        case e
            echo escape
        case j
            echo join
        case j0
            echo join0
        case le len
            echo length
        case lo
            echo lower
        case m
            echo match
        case p
            echo pad
        case repl
            echo replace
        case s
            echo split
        case s0
            echo split0
        case sh short
            echo shorten
        case t tr
            echo trim
        case une
            echo unescape
        case up
            echo upper
            # keep-sorted end
        case '*'
            echo $argv
    end
end
