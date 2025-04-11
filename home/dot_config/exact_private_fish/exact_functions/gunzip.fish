# Use unpigz over gunzip
if command -q unpigz
    function gunzip -w unpigz
        command unpigz $argv
    end
end
