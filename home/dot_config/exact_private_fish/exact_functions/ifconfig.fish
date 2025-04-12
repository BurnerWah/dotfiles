function ifconfig
    if isatty stdout && command -q grc
        grc ifconfig $argv
    else
        command ifconfig $argv
    end
end
