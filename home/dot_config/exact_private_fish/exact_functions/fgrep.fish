if command -q rg
    function fgrep -w 'rg -F' -d 'alias fgrep rg -F'
        rg -F $argv
    end
else if command -q ugrep
    function fgrep -w 'ugrep -F' -d 'alias fgrep ugrep -F'
        ugrep -F $argv
    end
else if command -q fgrep
    function fgrep -d 'alias fgrep fgrep --color=auto'
        command fgrep --color=auto $argv
    end
else
    function fgrep -w 'grep -F --color=auto' -d 'alias fgrep grep -F --color=auto'
        command grep -F --color=auto $argv
    end
end
