function traceroute --wraps=traceroute
    if isatty stdout; and command -q grc
        command grc traceroute $argv
    else
        command traceroute $argv
    end
end
