function du
    set -l cmd du
    if isatty stdout
        set -p argv --si
        if command -q grc
            set -p cmd grc
        end
    end
    command $cmd $argv
end
