function mount
    if isatty stdout; and command -q grc
        grc mount $argv
    else
        command mount $argv
    end
end
