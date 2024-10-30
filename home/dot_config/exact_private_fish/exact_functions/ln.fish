# Prefer uutils or coreutils ln if available, as they have more functionality
if command -qs uln
    function ln --wraps=uln
        uln $argv
    end
else if command -qs gln
    function ln --wraps=gln
        gln $argv
    end
else
    function ln
        command ln $argv
    end
end
