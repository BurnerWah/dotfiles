if command -q ugrep
    function grep
        ugrep -G $argv
        # compat: ugrep --sort -G -U -Y -. -Dread -dread
    end
else
    # @fish-lsp-disable-next-line 1004
    source $__fish_data_dir/functions/grep.fish
end
