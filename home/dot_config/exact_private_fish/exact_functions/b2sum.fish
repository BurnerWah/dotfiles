function b2sum --wraps=b2sum
    if command -q rainbow
        command rainbow b2sum $argv
    else
        command b2sum $argv
    end
end
