function mount
    if isatty stdout && command -q grc
        grc mount $argv
    else
        command mount $argv
    end
end
