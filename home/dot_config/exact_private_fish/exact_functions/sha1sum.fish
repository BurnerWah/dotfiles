function sha1sum
    if command -q rainbow && isatty stdout
        rainbow sha1sum $argv
    else
        command md5sum $argv
    end
end
