if command -q rg && command -q bzip2
    function bzgrep -w 'rg -z' -d 'alias bzgrep rg -z'
        rg -z $argv
    end
else if command -q ugrep
    # probably could check if ugrep has +bzip2 here
    function bzgrep -w 'ugrep -zG' -d 'alias bzgrep ugrep -zG'
        ugrep -zG $argv
        # ugrep --sort -G -U -Y -z -. -Dread -dread is more compatible
    end
end
