# prefer pbunzip2 to bunzip2
if command -q pbunzip2
    function bunzip2
        pbunzip2 $argv
    end
end
