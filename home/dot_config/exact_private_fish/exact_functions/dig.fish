function dig --wraps=dig --description "DNS lookup utility"
    if isatty stdout; and command -q grc
        command grc dig $argv
    else
        command dig $argv
    end
end
