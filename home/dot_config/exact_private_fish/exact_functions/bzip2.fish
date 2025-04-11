# prefer pbzip2 to bzip2
if command -q pbzip2
    function bzip2
        pbzip2 $argv
    end
end
