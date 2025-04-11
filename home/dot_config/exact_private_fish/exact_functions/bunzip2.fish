# prefer pbunzip2 to bunzip2
if command -q pbunzip2
    function bunzip2
        command pbunzip2 $argv
    end
end
