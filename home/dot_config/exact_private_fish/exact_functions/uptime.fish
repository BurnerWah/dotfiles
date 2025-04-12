function uptime
    if isatty stdout && command -q grc
        grc uptime $argv
    else
        command uptime $argv
    end
end
