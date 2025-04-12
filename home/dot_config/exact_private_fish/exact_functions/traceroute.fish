function traceroute
    if isatty stdout && command -q grc
        grc traceroute $argv
    else
        command traceroute $argv
    end
end
