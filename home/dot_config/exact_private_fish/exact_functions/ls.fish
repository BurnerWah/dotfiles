if command -qs eza
    function ls --wraps=eza --description 'List contents of directory'
        set -l cmd ls
        set -l param --color=auto
        if isatty stdout
            set cmd eza
            set -a param --classify --color-scale size
        end
        command $cmd $param $argv
    end
else if [ -e $__fish_data_dir/functions/ls.fish ]
    source $__fish_data_dir/functions/ls.fish
end
