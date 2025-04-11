function w --wraps=w
    if isatty stdout; and command -q grc
        command grc w $argv
    else
        command w $argv
    end
end
