function ping --wraps=ping
    if isatty stdout; and command -q grc
        command grc ping $argv
    else
        command ping $argv
    end
end
