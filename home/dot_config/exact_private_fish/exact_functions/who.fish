function who
    if isatty stdout; and command -q grc
        grc who $argv
    else
        command who $argv
    end
end
