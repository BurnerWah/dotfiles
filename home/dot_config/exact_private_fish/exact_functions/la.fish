set -l description "List contents of directory, including hidden files in directory using long format"
if command -q eza
    function la -w "eza -laFhM" -d "$description"
        eza --long \
            --all \
            --icons=auto \
            --no-quotes \
            --header \
            --mounts \
            $argv
    end
else
    function la -w ls -d "$description"
        ls -lAh $argv
    end
end
