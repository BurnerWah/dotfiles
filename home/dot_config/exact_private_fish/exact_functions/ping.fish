function ping
    if isatty stdout && command -q grc
        grc ping $argv
    else
        command ping $argv
    end
end
