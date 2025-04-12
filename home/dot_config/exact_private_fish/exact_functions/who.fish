function who
    if isatty stdout && command -q grc
        grc who $argv
    else
        command who $argv
    end
end
