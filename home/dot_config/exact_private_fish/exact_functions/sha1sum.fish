function sha1sum
    if command -q rainbow
        rainbow sha1sum $argv
    else
        command md5sum $argv
    end
end
