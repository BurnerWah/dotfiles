if command -q rg; and command -q gzip
    function zgrep -w 'rg -z' -d 'alias zgrep rg -z'
        command rg -z $argv
    end
else if command -q ugrep
    # probably could check if ugrep has +zlib here
    function zgrep -w 'ugrep -zG' -d 'alias zgrep ugrep -zG'
        command ugrep -zG $argv
        # ugrep --sort -G -U -Y -z -. -Dread -dread is more compatible
    end
end
