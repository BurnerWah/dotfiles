set -l description "List contents of directory using long format"
if command -q eza
    function ll -w "eza -l" -d "$description"
        eza --long $argv
    end
else
    function ll -w ls -d "$description"
        ls -lh $argv
    end
end
