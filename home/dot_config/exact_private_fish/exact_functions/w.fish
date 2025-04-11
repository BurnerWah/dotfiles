function w
    if isatty stdout; and command -q grc
        grc w $argv
    else
        command w $argv
    end
end
