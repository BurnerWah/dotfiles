function ifconfig --wraps=ifconfig
    if isatty stdout; and command -q grc
        command grc ifconfig $argv
    else
        command ifconfig $argv
    end
end
