function mount --wraps=mount
    if isatty stdout; and command -q grc
        command grc mount $argv
    else
        command mount $argv
    end
end
