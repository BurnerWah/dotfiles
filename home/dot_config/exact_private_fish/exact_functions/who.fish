function who --wraps=who
    if isatty stdout; and command -q grc
        command grc who $argv
    else
        command who $argv
    end
end
