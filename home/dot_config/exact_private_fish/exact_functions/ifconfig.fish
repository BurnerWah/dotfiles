function ifconfig
    if isatty stdout; and command -q grc
        grc ifconfig $argv
    else
        command ifconfig $argv
    end
end
