function traceroute
    if isatty stdout; and command -q grc
        grc traceroute $argv
    else
        command traceroute $argv
    end
end
