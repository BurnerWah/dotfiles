function b2sum
    if command -q rainbow && isatty stdout
        rainbow b2sum $argv
    else
        command b2sum $argv
    end
end
