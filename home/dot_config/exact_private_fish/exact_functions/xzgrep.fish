if command -q rg; and command -q xz
    function xzgrep -w 'rg -z' -d 'alias xzgrep rg -z'
        rg -z $argv
    end
else if command -q ugrep
    # probably could check if ugrep has +lzma here
    function xzgrep -w 'ugrep -zG' -d 'alias xzgrep ugrep -zG'
        ugrep -zG $argv
        # ugrep --sort -G -U -Y -z -. -Dread -dread is more compatible
    end
end
