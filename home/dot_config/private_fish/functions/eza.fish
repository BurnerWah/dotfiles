if command -qs eza
    function eza
        set -l param --color=auto
        if isatty stdout
            set -a param --color-scale size
        end
        command eza $param $argv
    end
end
