function w
    if isatty stdout && command -q grc
        grc w $argv
    else
        command w $argv
    end
end
