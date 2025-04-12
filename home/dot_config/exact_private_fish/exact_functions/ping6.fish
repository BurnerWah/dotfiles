if command -q ping6
    function ping6
        if isatty stdout && command -q grc
            grc ping6 $argv
        else
            command ping6 $argv
        end
    end
else
    function ping6 -w "ping -6" -d 'alias ping6 ping -6'
        ping -6 $argv
    end
end
