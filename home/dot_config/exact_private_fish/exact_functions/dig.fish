function dig -d "DNS lookup utility"
    if isatty stdout; and command -q grc
        grc dig $argv
    else
        command dig $argv
    end
end
