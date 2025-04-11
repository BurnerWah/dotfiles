function netstat -d "Displays network-related information" --wraps=netstat
    if isatty stdout; and command -q grc
        command grc netstat $argv
    else
        command netstat $argv
    end
end
