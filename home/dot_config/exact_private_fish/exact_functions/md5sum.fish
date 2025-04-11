function md5sum
    if command -q rainbow
        rainbow md5sum $argv
    else
        command md5sum $argv
    end
end
