if command -q rg && command -q bzip2
    function bzfgrep -w 'rg -zF' -d 'alias bzfgrep rg -zF'
        rg -zF $argv
    end
else if command -q ugrep
    function bzfgrep -w 'ugrep -zF' -d 'alias bzfgrep ugrep -zF'
        ugrep -zF $argv
        # ugrep --sort -F -U -Y -z -. -Dread -dread is more compatible
    end
end
