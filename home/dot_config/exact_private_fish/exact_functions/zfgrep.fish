if command -q rg; and command -q gzip
    function zfgrep -w 'rg -zF' -d 'alias zfgrep rg -zF'
        rg -zF $argv
    end
else if command -q ugrep
    function zfgrep -w 'ugrep -zF' -d 'alias zfgrep ugrep -zF'
        ugrep -zF $argv
        # compatible version: ugrep --sort -F -U -Y -z -. -Dread -dread
    end
end
