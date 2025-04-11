if command -q rg
    function egrep -w rg -d 'alias egrep rg'
        rg $argv
    end
else if command -q ugrep
    function egrep -w 'ugrep -E' -d 'alias egrep ugrep -E'
        ugrep -E $argv
        # technicall ugrep --sort -E -U -Y -. -Dread -dread is more compatible
    end
else if command -q egrep
    function egrep -d 'alias egrep egrep --color=auto'
        command egrep --color=auto $argv
    end
else
    function egrep -w 'grep -E --color=auto' -d 'alias egrep grep -E --color=auto'
        command grep -E --color=auto $argv
    end
end
