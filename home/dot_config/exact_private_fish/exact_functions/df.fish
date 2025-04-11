function df
    set -l cmd df
    if isatty stdout
        set -p argv --si
        if command -q grc
            set -p cmd grc
        end
    end
    command $cmd $argv
end
