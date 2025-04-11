# prefer pbzcat to bzcat
if command -q pbzcat
    function bzcat
        command pbzcat $argv
    end
end
