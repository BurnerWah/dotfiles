if command -q ugrep
    function grep
        command ugrep -G $argv
        # compat: ugrep --sort -G -U -Y -. -Dread -dread
    end
end
