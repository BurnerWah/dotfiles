function id -d "Display current user and group identity"
    if isatty stdout && command -q grc
        grc id $argv
    else
        command id $argv
    end
end
