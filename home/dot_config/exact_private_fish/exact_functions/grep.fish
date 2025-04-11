if command -q ugrep
    function grep
        ugrep -G $argv
        # compat: ugrep --sort -G -U -Y -. -Dread -dread
    end
end
