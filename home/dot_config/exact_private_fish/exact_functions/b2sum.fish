function b2sum
    if command -q rainbow
        rainbow b2sum $argv
    else
        command b2sum $argv
    end
end
