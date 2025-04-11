function ping
    if isatty stdout; and command -q grc
        grc ping $argv
    else
        command ping $argv
    end
end
