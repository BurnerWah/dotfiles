if command -q rg; and command -q gzip
    function zegrep -w 'rg -z' -d 'alias zegrep rg -z'
        rg -z $argv
    end
else if command -q ugrep
    function zegrep -w 'ugrep -zE' -d 'alias zegrep ugrep -zE'
        ugrep -zE $argv
        # ugrep --sort -E -U -Y -z -. -Dread -dread is more compatible
    end
end
