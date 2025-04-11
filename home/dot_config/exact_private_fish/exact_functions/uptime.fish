function uptime
    if isatty stdout; and command -q grc
        grc uptime $argv
    else
        command uptime $argv
    end
end
