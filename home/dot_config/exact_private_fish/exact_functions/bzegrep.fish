if command -q rg; and command -q bzip2
    function bzegrep -w 'rg -z' -d 'alias bzegrep rg -z'
        rg -z $argv
    end
else if command -q ugrep
    function bzegrep -w 'ugrep -zE' -d 'alias bzegrep ugrep -zE'
        ugrep -zE $argv
        # ugrep --sort -E -U -Y -z -. -Dread -dread is more compatible
    end
end
