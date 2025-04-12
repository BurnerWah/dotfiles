function dig -d "DNS lookup utility"
    if isatty stdout && command -q grc
        grc dig $argv
    else
        command dig $argv
    end
end
