# Use unpigz over gunzip
if command -q unpigz
    function gunzip -w unpigz
        unpigz $argv
    end
end
