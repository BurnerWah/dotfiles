function uptime --wraps=uptime
    if isatty stdout; and command -q grc
        command grc uptime $argv
    else
        command uptime $argv
    end
end
