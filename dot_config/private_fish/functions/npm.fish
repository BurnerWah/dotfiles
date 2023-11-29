function npm
    if command -qs npq
        npq $argv
    else
        command npm $argv
    end
end
