# Use pigz over gzip
if command -q pigz
    function gzip -w pigz
        command pigz $argv
    end
end
