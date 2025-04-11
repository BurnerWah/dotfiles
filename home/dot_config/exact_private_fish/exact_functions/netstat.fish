function netstat -d "Displays network-related information"
    if isatty stdout; and command -q grc
        grc netstat $argv
    else
        command netstat $argv
    end
end
