# Use pigz over gzip
if command -q pigz
    function gzip -w pigz
        pigz $argv
    end
end
