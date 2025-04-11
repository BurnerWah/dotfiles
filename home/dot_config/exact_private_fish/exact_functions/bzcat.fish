# prefer pbzcat to bzcat
if command -q pbzcat
    function bzcat
        pbzcat $argv
    end
end
