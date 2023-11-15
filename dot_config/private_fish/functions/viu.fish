if command -qs viu
    function viu
        if [ "$TERM_PROGRAM" = vscode ]
            set -lx TERM_PROGRAM vscode+iTerm
            command viu $argv
        else
            command viu $argv
        end
    end
end
