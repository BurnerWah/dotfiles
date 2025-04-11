if command -q rg; and command -q xz
    function xzfgrep -w 'rg -zF' -d 'alias xzfgrep rg -zF'
        rg -zF $argv
    end
else if command -q ugrep
    function xzfgrep -w 'ugrep -zF' -d 'alias xzfgrep ugrep -zF'
        ugrep -zF $argv
        # compatible version: ugrep --sort -F -U -Y -z -. -Dread -dread
    end
end
