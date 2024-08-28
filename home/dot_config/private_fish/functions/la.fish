set -l description "List contents of directory, including hidden files in directory using long format"
if command -qs eza
    function la -w "eza -laFhM" -d "$description"
        eza --classify \
            --long \
            --all \
            --icons=auto \
            --no-quotes \
            --time-style=relative \
            --header \
            --mounts \
            $argv
    end
else if command -qs exa
    function la -w "exa -la" -d "$description"
        exa --long --all $argv
    end
else
    function la -w ls -d "$description"
        ls -lah $argv
    end
end