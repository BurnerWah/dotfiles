if command -q rg; and command -q xz
    function xzegrep -w 'rg -z' -d 'alias xzegrep rg -z'
        rg -z $argv
    end
else if command -q ugrep
    function xzegrep -w 'ugrep -zE' -d 'alias xzegrep ugrep -zE'
        ugrep -zE $argv
        # ugrep --sort -E -U -Y -z -. -Dread -dread is more compatible
    end
end
