# Exa is outdated, use eza
if command -qs eza
    function exa --wraps=eza --description 'alias exa eza'
        eza $argv
    end
else if command -qs exa
    function exa
        set -l param --color=auto --color-scale
        isatty stdout && set -a param --classify
        command exa $param $argv
    end
end
